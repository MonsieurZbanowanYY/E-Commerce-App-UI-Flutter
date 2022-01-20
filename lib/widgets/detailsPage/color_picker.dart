import 'package:flutter/material.dart';

Padding buildColorPicker(Color color, bool isDarkMode, Size size) {
  return Padding(
    padding: const EdgeInsets.all(5.0),
    child: Container(
      width: size.width * 0.08,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: Border.all(
          color: isDarkMode ? Colors.white : Colors.black,
          width: 0.5,
        ),
      ),
    ),
  );
}
