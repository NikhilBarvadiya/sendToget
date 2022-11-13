// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:sendtoget/Data/Model/ThemePreferences.dart';

class ThemeModel extends ChangeNotifier {
  late bool _isDark;
  late ThemePreferences _preferences;

  bool get isDark => _isDark;

  ThemeModel() {
    _isDark = false;
    _preferences = ThemePreferences();
    getPreferences();
  }

  set isDark(bool value) {
    _isDark = value;
    _preferences.setTheme(value);
    notifyListeners();
  }

  getPreferences() async {
    _isDark = await _preferences.getTheme();
    notifyListeners();
  }
}
