import 'package:flutter/material.dart';

const List<int> monthNumbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];

const int _kPurplePrimaryValue = 0xFF6200EE;

const MaterialColor kPurpleSwatch = MaterialColor(
  _kPurplePrimaryValue,
  <int, Color>{
    50: Color(0xFFF2E7FE),
    100: Color(0xFFD7B7FD),
    200: Color(0xFFBB86FC),
    300: Color(0xFF9E55FC),
    400: Color(0xFF7F22FD),
    500: Color(_kPurplePrimaryValue),
    600: Color(0xFF3700B3),
    700: Color(0xFF270096),
    800: Color(0xFF190078),
    900: Color(0xFF190078),
  },
);
