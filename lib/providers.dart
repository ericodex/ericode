import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ThemeProvider with ChangeNotifier {
  ThemePreference themePreference = ThemePreference();
  bool _darkTheme = false;

  bool get darkMode => _darkTheme;

  set darkMode(bool value) {
    _darkTheme = value;
    themePreference.setDarkTheme(value);
    notifyListeners();
  }
}

class ThemePreference {
  static const themeStatus = "themeStatus";

  setDarkTheme(bool value) async {
    SharedPreferences preference = await SharedPreferences.getInstance();
    preference.setBool(themeStatus, value);
  }

  Future<bool> getTheme() async {
    SharedPreferences preference = await SharedPreferences.getInstance();
    return preference.getBool(themeStatus) ?? false;
  }
}
