// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  List<String> favoriteLocations = [];

  @override
  void initState() {
    super.initState();
    loadFavoriteLocations();
  }

  Future<void> loadFavoriteLocations() async {
    final prefs = await SharedPreferences.getInstance();
    final savedLocations = prefs.getStringList('favorite_locations') ?? [];
    setState(() {
      favoriteLocations = savedLocations;
    });
  }

  Future<void> saveFavoriteLocation(String location) async {
    final prefs = await SharedPreferences.getInstance();
    favoriteLocations.add(location);
    await prefs.setStringList('favorite_locations', favoriteLocations);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Locations'),
      ),
      body: ListView.builder(
        itemCount: favoriteLocations.length,
        itemBuilder: (context, index) {
          final location = favoriteLocations[index];
          return ListTile(
            title: Text(location),
            // Add any actions you want for each favorite location (e.g., delete)
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                removeFavoriteLocation(index);
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Display a dialog or a form to add a new favorite location
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Add Favorite Location'),
                content: TextField(
                  onChanged: (value) {
                    // Handle user input for the new location
                  },
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      const newLocation =
                          'New Location'; // Replace with user input
                      saveFavoriteLocation(newLocation);
                      Navigator.pop(context);
                    },
                    child: Text('Save'),
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void removeFavoriteLocation(int index) async {
    final prefs = await SharedPreferences.getInstance();
    favoriteLocations.removeAt(index);
    await prefs.setStringList('favorite_locations', favoriteLocations);
    setState(() {});
  }
}

void main() {
  runApp(MaterialApp(
    home: LocationPage(),
  ));
}
