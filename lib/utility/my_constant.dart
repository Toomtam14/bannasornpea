import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyConstant {
  // Field
  static Color primary = Color.fromARGB(132, 181, 80, 215);
  static Color dark = Color.fromARGB(255, 128, 128, 128);
  static Color active = Colors.red;
  static Color light = Color.fromARGB(154, 8, 123, 114);

  // Method

  BoxDecoration bgBox() {
    return BoxDecoration(
      gradient: RadialGradient(
        radius: 1.0,
        center: Alignment(-0.3, -0.2),
        colors: [Colors.white, primary],
      ),
    );
  }

  TextStyle h1Style() {
    return GoogleFonts.athiti(
        textStyle: TextStyle(
      fontSize: 36,
      color: dark,
      fontWeight: FontWeight.bold,
    ));
  }

  TextStyle h2Style() {
    return GoogleFonts.athiti(
        textStyle: TextStyle(
      fontSize: 22,
      color: light,
      fontWeight: FontWeight.w700,
    ));
  }

  TextStyle h3Style() {
    return GoogleFonts.athiti(
        textStyle: TextStyle(
      fontSize: 20,
      color: dark,
      fontWeight: FontWeight.normal,
    ));
  }

  TextStyle h3ActiveStyle() {
    return GoogleFonts.athiti(
        textStyle: TextStyle(
      fontSize: 20,
      color: active,
      fontWeight: FontWeight.normal,
    ));
  }
}
