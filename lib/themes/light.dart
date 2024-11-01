import 'package:flutter/material.dart';

ThemeData light = ThemeData(
  colorScheme: ColorScheme.light(
    surface: const Color.fromARGB(255, 235, 201, 173),
    shadow: const Color.fromARGB(255, 0, 0, 0).withOpacity(.3),
    primary: const Color.fromARGB(255, 218, 210, 206),
    secondary: const Color.fromARGB(139, 40, 71, 135),
    inversePrimary: const Color.fromARGB(255, 142, 126, 112),
    onPrimary: Colors.white,
    error: const Color.fromARGB(255, 125, 48, 48),
  ),
);
