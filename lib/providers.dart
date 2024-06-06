import 'package:ericode/main.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ThemeProvider with ChangeNotifier {
  ThemePreference themePreference = ThemePreference();
  String _themePreference = ThemeTypes.light;

  String get preference => _themePreference;

  set preference(String value) {
    _themePreference = value;
    themePreference.setDarkTheme(value);
    notifyListeners();
  }
}

class ThemePreference {
  static const themeStatus = "themeStatus";

  setDarkTheme(String value) async {
    SharedPreferences preference = await SharedPreferences.getInstance();
    preference.setString(themeStatus, value);
  }

  Future<String> getTheme() async {
    SharedPreferences preference = await SharedPreferences.getInstance();
    return preference.getString(themeStatus)!;
  }
}
