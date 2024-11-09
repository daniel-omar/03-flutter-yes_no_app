import 'package:flutter/material.dart';

const Color _customColor = Color(0xFF5C11D4);

const List<Color> _customTheme = [
  _customColor,
  Colors.blue,
  Colors.black54,
  Colors.teal,
  Colors.yellow,
  Colors.green
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0})
      : assert(selectedColor >= 0 && selectedColor <= (_customTheme.length - 1),
            'Debe ser mayor a 0 y menor a ${_customTheme.length}');

  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _customTheme[selectedColor],
      brightness: Brightness.light,
    );
  }
}
