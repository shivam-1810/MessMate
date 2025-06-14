import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget weeklyScheduleCard({
  required Map<String, String> meal,
  required double containerWidth,
  required double containerHeight,
}) {
  return Padding(
    padding: const EdgeInsets.only(top: 25.0),
    child: Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: containerWidth,
          height: containerHeight,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white.withOpacity(0.15),
              width: 2.65,
            ),
            color: const Color.fromRGBO(38, 38, 38, 0.69),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(80),
            ),
          ),
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Spacer(
                flex: 3,
              ),
              Text(
                meal['day']!,
                style: GoogleFonts.jimNightshade(
                  fontSize: 30,
                  color: Color.fromRGBO(255, 183, 3, 1),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                meal['menu']!,
                textAlign: TextAlign.center,
                style: GoogleFonts.portLligatSans(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
              Spacer(),
            ],
          ),
        ),
        Positioned(
          top: -120,
          left: -235,
          child: Image.asset(
            'assets/images/scheduled_lunch.png',
            width: 650,
            height: 250,
          ),
        ),
      ],
    ),
  );
}
