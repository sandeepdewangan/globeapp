import 'package:shared_preferences/shared_preferences.dart';

class SPSettings {
  final String fontSizeKey = 'font_size';
  final String colorKey = 'color';
  static SharedPreferences _sp;

  // -------- Optimization START --------
  // creating resources everytime SPSettings is called is a waste of CPU time.
  // so here we will use factory pattern to avoid this.
  static SPSettings _instance;
  // create private named constructor
  SPSettings._internal();
  // create unnamed constructor with factory keyword
  // factory return the instance which are cached or subclass.
  factory SPSettings() {
    if (_instance == null) {
      _instance = SPSettings
          ._internal(); // if instance is not created then assign to named constructor.
    }
    return _instance;
  }
  // -------- Optimization END --------

  // step 01 - get instances
  Future init() async {
    _sp = await SharedPreferences.getInstance();
  }

  // COLOR Setting
  // step 02 - set color
  Future setColor(int color) async {
    return _sp.setInt(colorKey, color);
  }

  // step 03 - get color
  int getColor() {
    int color = _sp.getInt(colorKey);
    if (color == null) {
      color = 0xff125689;
    }
    return color;
  }

  // Font Setting
  // step 02 - set color
  Future setFontSize(double size) async {
    return _sp.setDouble(fontSizeKey, size);
  }

  // step 03 - get color
  double getFontSize() {
    double size = _sp.getDouble(fontSizeKey);
    if (size == null) {
      size = 16;
    }
    return size;
  }
}
