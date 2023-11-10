import 'package:flutter/material.dart';

class SettingProvider extends ChangeNotifier {
  String currentLocal = "en";
  ThemeMode currentTheme = ThemeMode.light;

  changeCurrentLocale(String newLocale) {
    currentLocal = newLocale;
    notifyListeners();
  }
  changeCurrentTheme(ThemeMode newTheme){
    currentTheme=newTheme;
    notifyListeners();
  }
}
