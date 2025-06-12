import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget loginSignupTextField({
  required String hintText,
  required bool obscureText,
}) {
  return TextField(
    obscureText: obscureText,
    style: const TextStyle(color: Colors.white),
    decoration: InputDecoration(
      hintText: hintText,
      hintStyle: GoogleFonts.poppins(color: Colors.white70, fontSize: 20),
      filled: true,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(24),
        borderSide: const BorderSide(
          color: Color.fromRGBO(255, 255, 255, 0.36),
          width: 2,
        ),
      ),
      fillColor: const Color.fromRGBO(83, 82, 82, 0.77),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(24),
        borderSide: BorderSide.none,
      ),
    ),
  );
}
