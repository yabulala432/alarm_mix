import 'package:flutter/material.dart';

ThemeData dark = ThemeData(
  colorScheme: ColorScheme.dark(
    surface: const Color.fromARGB(255, 67, 81, 100),
    primary: const Color.fromARGB(188, 49, 35, 28),
    secondary: const Color.fromARGB(161, 3, 48, 31),
    inversePrimary: const Color(0xff212832),
    error: const Color.fromARGB(255, 158, 67, 67),
    onPrimary: Colors.white,
    shadow: const Color.fromARGB(255, 28, 20, 16).withOpacity(.3),
  ),
);
