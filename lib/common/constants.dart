import 'package:flutter/material.dart';

final kColorSchema = ColorScheme.fromSeed(
  seedColor: Color.fromARGB(255, 96, 59, 181),
);
final kDarkColorSchema = ColorScheme.fromSeed(
  seedColor: Color.fromARGB(255, 5, 99, 125),
);

class Constants {
  static ThemeData mainTheme = ThemeData().copyWith(
    colorScheme: kColorSchema,
    appBarTheme: AppBarTheme().copyWith(
      backgroundColor: kColorSchema.onPrimaryContainer,
      foregroundColor: kColorSchema.primaryContainer,
    ),
    cardTheme: CardThemeData().copyWith(
      color: kColorSchema.secondaryContainer,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: kColorSchema.primaryContainer,
      ),
    ),
    textTheme: ThemeData().textTheme.copyWith(
      titleLarge: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
        color: kColorSchema.onSecondaryContainer,
      ),
    ),
    bottomSheetTheme: BottomSheetThemeData().copyWith(
      backgroundColor: Colors.white,
    ),
  );
  static ThemeData mainDarkTheme = ThemeData.dark().copyWith(
    colorScheme: kDarkColorSchema,
    appBarTheme: AppBarTheme().copyWith(
      backgroundColor: kDarkColorSchema.onPrimaryContainer,
      foregroundColor: kDarkColorSchema.primaryContainer,
    ),
    cardTheme: CardThemeData().copyWith(
      color: kDarkColorSchema.secondaryContainer,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: kDarkColorSchema.primaryContainer,
      ),
    ),
    textTheme: ThemeData().textTheme.copyWith(
      titleLarge: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
        color: kDarkColorSchema.onSecondaryContainer,
      ),
    ),

    bottomSheetTheme: BottomSheetThemeData().copyWith(
      backgroundColor: kDarkColorSchema.onSecondaryContainer,
    ),

    inputDecorationTheme: InputDecorationTheme(
      // Customize label text color for dark mode
      labelStyle: TextStyle(color: Colors.white70),

      // Customize hint text color for dark mode
      hintStyle: TextStyle(color: Colors.grey),
      // Customize focused border color for dark mode
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blueAccent),
      ),
      // Customize enabled border color for dark mode
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.shade700),
      ),
      // Customize filled background color for dark mode
      fillColor: Colors.grey.shade800,
      filled: true,
    ),
  );
}
