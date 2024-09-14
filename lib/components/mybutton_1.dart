import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyButton1 extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const MyButton1({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(onPressed: onPressed, child: Text(text,
    style: GoogleFonts.protestGuerrilla(
      fontSize: 25
    ),),);
  }
}
