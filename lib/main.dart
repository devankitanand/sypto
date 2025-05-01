import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.blue,
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.amber),
      textTheme: TextTheme(
        displayLarge: TextStyle(
            fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.blue),
        bodyLarge: TextStyle(fontSize: 16.0, color: Colors.black87),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.blue,
        titleTextStyle: TextStyle(
            fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: Colors.blue,
        textTheme: ButtonTextTheme.primary,
      ),
    ),
    home: HomeScreen(),
  ));
}
