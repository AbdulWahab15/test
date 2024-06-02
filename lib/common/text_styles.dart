import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'font_size.dart';

abstract class TestTheme {
  static const TextStyle w400f12 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: TestFonts.fontSize12,
  );
  static const TextStyle w400f14 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: TestFonts.fontSize14,
  );
  static const TextStyle w500f14 = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: TestFonts.fontSize14,
  );
  static const TextStyle w400f17 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: TestFonts.fontSize17,
  );
  static const TextStyle w500f19 = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: TestFonts.fontSize19,
  );
  static const TextStyle w400f19 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: TestFonts.fontSize19,
  );
  static const TextStyle w500f25 = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: TestFonts.fontSize27,
  );
  static const TextStyle w600f27 = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 34,
  );
  static TextStyle setTextStyle({required TextStyle style, Color? color}) {
    return GoogleFonts.montserrat(
      textStyle: style.copyWith(color: color),
    );
  }
}
