import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_structure/local/core/Constant/Colors.dart';
import 'package:new_structure/local/core/themes/dark/dark_theme_text.dart';
import 'package:new_structure/local/core/themes/light/light_theme_text.dart';

class AppTheme {
  ThemeData currentTheme = AppTheme.lightsTheme;
  static ThemeData lightsTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: AppColors.white,
     primaryColor: AppColors.primaryColor,
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: AppColors.primaryColor,
      primary: AppColors.primaryColor,
    ),
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColors.primaryColor),
      centerTitle: true,
    ),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),
    textTheme: TextTheme(
      displaySmall: GoogleFonts.inter(textStyle: displaySmallLight()),
      displayMedium: GoogleFonts.inter(textStyle: displayMediumLight()),
      displayLarge: GoogleFonts.inter(textStyle: displayLargeLight()),
    ),
  );

  static ThemeData darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppColors.black,
      primaryColor: AppColors.primaryColor,
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: AppColors.primaryColor,
      primary: AppColors.primaryColor,
    ),
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColors.primaryColor),
      centerTitle: true,
    ),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),
    textTheme: TextTheme(
      displaySmall: GoogleFonts.inter(textStyle: displaySmallDark()),
      displayMedium: GoogleFonts.inter(textStyle: displayMediumDark()),
      displayLarge: GoogleFonts.inter(textStyle: displayLargeDark()),
    ),
   
  );
}
