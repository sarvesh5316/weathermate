// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart'; // For working with coordinates

class SatelliteViewPage extends StatelessWidget {
  const SatelliteViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Satellite View'),
      ),
      body: FlutterMap(
        options: MapOptions(
          center: const LatLng(
              37.7749, -122.4194), // Default to San Francisco coordinates
          zoom: 12.0, // Adjust the initial zoom level as needed
        ),
        // layers: [
        //   TileLayerOptions(
        //     // Use your Mapbox access token and style URL
        //     urlTemplate: 'https://api.mapbox.com/styles/v1/mapbox/satellite-v9/tiles/{z}/{x}/{y}?access_token=YOUR_MAPBOX_ACCESS_TOKEN',
        //   ),
        // ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: SatelliteViewPage(),
  ));
}
