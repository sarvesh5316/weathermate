import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weathermate/consts.dart';
import 'package:weathermate/screens/home_screen.dart';
// import 'package:weatherapp_starter_project/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: appName,
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
