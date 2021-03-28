import 'package:flutter/material.dart';
import '../data/shared_prefs.dart';
import '../models/font_size.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  int settingColor = 0xff1976d2;
  List<int> colors = [
    0xFF556923,
    0xFF556963,
    0xFF126999,
    0xFF886923,
    0xFF026923
  ];
  double fontSize = 16.0;
  final List<FontSize> fontSizes = [
    FontSize('small', 12),
    FontSize('medium', 16),
    FontSize('large', 20),
    FontSize('extra-large', 24)
  ];
  SPSettings setting;

  List<DropdownMenuItem<String>> getDropdownMenuItems() {
    List<DropdownMenuItem<String>> items = [];
    for (FontSize fontSize in fontSizes) {
      items.add(DropdownMenuItem(
        value: fontSize.size.toString(),
        child: Text(fontSize.name),
      ));
    }
    return items;
  }

  @override
  void initState() {
    setting = SPSettings();
    setting.init().then((value) {
      setState(() {
        settingColor = setting.getColor();
        fontSize = setting.getFontSize();
      });
    });
    super.initState();
  }

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
          Text(
            'Choose a font size for the app!',
            style: TextStyle(fontSize: fontSize),
          ),
          DropdownButton(
            items: getDropdownMenuItems(),
            value: fontSize.toString(),
            onChanged: changeFontSize,
          ),
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

  void changeFontSize(String newSize) {
    setting.setFontSize(double.parse(newSize));
    setState(() {
      fontSize = double.parse(newSize);
    });
  }

  void setColor(int color) {
    setState(() {
      this.settingColor = color;
      setting.setColor(color);
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
