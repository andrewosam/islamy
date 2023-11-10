import 'package:flutter/material.dart';
import 'package:islamy/ui/utils/app_colors.dart';

abstract class AppTheme {
  static ThemeData lightTheme = ThemeData(
    canvasColor: AppColors.primiary,
      scaffoldBackgroundColor: Colors.transparent,
      primaryColor: AppColors.primiary,
      textTheme: const TextTheme(
        bodySmall: TextStyle(
            fontSize: 30, fontWeight: FontWeight.bold, color: AppColors.accent),
        titleSmall: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        titleMedium: TextStyle(color: AppColors.primiary, fontSize: 14),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        unselectedIconTheme: IconThemeData(size: 30),
          selectedItemColor: AppColors.accent,
          selectedIconTheme: IconThemeData(
            size: 36,
          ),
          selectedLabelStyle: TextStyle(color: AppColors.accent, fontSize: 12)),
      appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          titleTextStyle: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: AppColors.accent)));
  static ThemeData darkTheme = ThemeData(
      canvasColor: AppColors.primiaryDark,
      scaffoldBackgroundColor: Colors.transparent,
      primaryColor: AppColors.primiaryDark,
      textTheme: const TextTheme(
        bodySmall: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: AppColors.white),
        titleSmall: TextStyle(fontWeight: FontWeight.bold, fontSize: 14,color: AppColors.white),
        titleMedium: TextStyle(color: AppColors.primiaryDark, fontSize: 14),
        titleLarge: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: AppColors.white)
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(

          selectedItemColor: AppColors.accentDark,
          selectedIconTheme: IconThemeData(
            size: 36,
          ),
          selectedLabelStyle: TextStyle(color: AppColors.accentDark, fontSize: 12)),
      appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          titleTextStyle: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: AppColors.white)));
}
