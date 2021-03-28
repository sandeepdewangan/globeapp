import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  int settingColor = 0xff1976d2;
  double size = 16.0;
  List<int> colors = [
    0xFF556923,
    0xFF556963,
    0xFF126999,
    0xFF886923,
    0xFF026923
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: Color(settingColor),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('App Main Color'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () => setColor(colors[0]),
                child: ColorBox(colors[0]),
              ),
              GestureDetector(
                onTap: () => setColor(colors[1]),
                child: ColorBox(colors[1]),
              ),
              GestureDetector(
                onTap: () => setColor(colors[2]),
                child: ColorBox(colors[2]),
              ),
              GestureDetector(
                onTap: () => setColor(colors[3]),
                child: ColorBox(colors[3]),
              ),
              GestureDetector(
                onTap: () => setColor(colors[4]),
                child: ColorBox(colors[4]),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void setColor(int color) {
    setState(() {
      this.settingColor = color;
    });
  }
}

// Color Box widget
class ColorBox extends StatelessWidget {
  final int color;
  ColorBox(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        color: Color(color),
      ),
    );
  }
}
