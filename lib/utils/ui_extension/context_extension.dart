import 'package:flutter/material.dart';

extension $BuildContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  ColorScheme get colorScheme => theme.colorScheme;

  NavigatorState get navigator => Navigator.of(this);

  MediaQueryData get mediaQuery => MediaQuery.of(this);

  double get height => mediaQuery.size.height;

  double get width => mediaQuery.size.width;

  void hideKeyboard() {
    final FocusScopeNode focusScope = FocusScope.of(this);
    if (focusScope.hasFocus) {
      focusScope.unfocus();
    }
  }
}
