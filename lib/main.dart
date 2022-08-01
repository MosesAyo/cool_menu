import 'package:flutter/material.dart';
import './layout_screen.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter Demo',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Colors.blueAccent,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    home: LayoutScreen(),
  ));
}
