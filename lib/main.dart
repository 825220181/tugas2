import 'package:flutter/material.dart';
import 'package:tugass/SplashScreen.dart';
import 'package:tugass/pages/home_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        fontFamily: "Cabin",
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),  // Themedata
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}