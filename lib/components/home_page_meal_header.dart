import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mess_app/pages/schedule_page.dart';

Widget mealHeader(BuildContext context, String title) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 12.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: GoogleFonts.averiaSerifLibre(
            color: const Color.fromRGBO(255, 255, 255, 0.83),
            fontSize: 24,
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return SchedulePage();
            }));
          },
          child: Text(
            "View Weekly ",
            style: GoogleFonts.averiaSerifLibre(
              color: const Color.fromRGBO(255, 255, 255, 0.5),
              fontSize: 13,
              height: 0.95,
            ),
          ),
        ),
      ],
    ),
  );
}
