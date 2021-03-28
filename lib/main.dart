import 'package:flutter/material.dart';
import './screens/settings.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Globe App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SettingScreen(),
    );
  }
}
