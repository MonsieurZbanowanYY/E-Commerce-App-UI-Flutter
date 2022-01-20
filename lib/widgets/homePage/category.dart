import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget buildCategory(
  String categoryName,
  Color firstColor,
  Color secondColor,
  Size size,
) {
  return Container(
    height: size.width * 0.08,
    width: size.width * 0.18,
    decoration: BoxDecoration(
      color: secondColor,
      border: Border.all(
        color: firstColor,
        width: 1,
      ),
      borderRadius: const BorderRadius.all(
        Radius.circular(8),
      ),
    ),
    child: Align(
      child: Text(
        categoryName,
        style: GoogleFonts.lato(
          color: firstColor,
          fontSize: size.height * 0.015,
        ),
      ),
    ),
  );
}
