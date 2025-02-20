import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract class AppTheme {
  static const defaultFontFamily = "DM Sans";

  static ThemeData themColors() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
        statusBarColor: Colors.black,
        systemNavigationBarIconBrightness: Brightness.light,
        systemNavigationBarColor: Colors.transparent,
      ),
    );
    return themeData(darkColorScheme);
  }

  static ThemeData themeData(ColorScheme colorScheme) {
    return ThemeData(
        fontFamily: 'Inter',
        colorScheme: colorScheme,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.black,
        ),
        brightness: colorScheme.brightness,
        cardTheme: cardTheme(colorScheme),
        appBarTheme: AppBarTheme(backgroundColor: colorScheme.background));
  }

  static CardTheme cardTheme(ColorScheme colorScheme) {
    return CardTheme(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      margin: EdgeInsets.zero,
      color: colorScheme.primary,
      surfaceTintColor: colorScheme.primary,
      clipBehavior: Clip.hardEdge,
      shadowColor: colorScheme.shadow,
    );
  }

  static const darkColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFFFFFFFF),
    onPrimary: Color(0xFF6E413C),
    background: Color(0xFF000000),
// Use the dominant color of your gradient
    onBackground: Color(0xFF6C7278),
    surface: Color(0xFF1A1C1E),
    onSurface: Color(0xFF000000),
    secondary: Color(0xFF413938),
    onTertiary: Color(0xFF4D81E7),
    onSecondary: Color(0XFFEDF1F3),
    tertiary: Color(0xFFFAFAFD),
    surfaceVariant: Color(0xFF1D1D1D),
    onSurfaceVariant: Color(0xFF8F9098),

    /// not used
    error: Color(0xFFF61D1D),
    onError: Color(0xFFF5F7F9),
    outline: Color(0xFF8692A6),
    outlineVariant: Color(0xFF86BB71),
    shadow: Color(0xFF99ABC6),
    primaryContainer: Color(0xFF1565D8),
    onPrimaryContainer: Color(0xFFAAA6B9),
    inverseSurface: Color(0XFFD8D8D8),
    onInverseSurface: Color(0XFF524B6B),
    tertiaryContainer: Color(0xFFF2F2F3),
    onTertiaryContainer: Color(0xFF777777),
    surfaceTint: Color(0xFFF4F4F4),
    scrim: Color(0XFF222222),
    onSecondaryContainer: Color(0XFFF9F9F9),
    secondaryContainer: Colors.orange,
    inversePrimary: Color(0XFF0D0D26),
  );
}
