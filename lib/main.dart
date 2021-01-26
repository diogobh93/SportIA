import 'package:SportIA/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SportIA',
      theme: _buildTheme(),
      home: Home(),
    );
  }

  _buildTheme() {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: Color(0xFF212121),
      accentColor: Colors.green,
      primarySwatch: Colors.green,
    );
  }
}
