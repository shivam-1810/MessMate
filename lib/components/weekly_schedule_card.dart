import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget weeklyScheduleCard({
  required Map<String, String> menuList,
  required String mealType,
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
                menuList['day'] ?? 'Day',
                style: GoogleFonts.jimNightshade(
                  fontSize: 30,
                  color: Color.fromRGBO(255, 183, 3, 1),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                menuList[mealType] ?? 'No Meal Data',
                textAlign: TextAlign.center,
                style: GoogleFonts.portLligatSans(
                  fontSize: 14,
                  color: Colors.white,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              Spacer(),
            ],
          ),
        ),
        mealType == 'Lunch'
            ? Positioned(
                top: -120,
                left: -235,
                child: Image.asset(
                  _getMealImage(mealType),
                  width: 655,
                  height: 252,
                ),
              )
            : Positioned(
                top: -85,
                right: 12,
                child: Image.asset(
                  _getMealImage(mealType),
                  width: 140,
                  height: 140,
                ),
              ),
      ],
    ),
  );
}

String _getMealImage(String mealType) {
  switch (mealType.toLowerCase()) {
    case 'breakfast':
      return 'assets/images/scheduled_breakfast.png';
    case 'lunch':
      return 'assets/images/scheduled_lunch.png';
    case 'snacks':
      return 'assets/images/scheduled_snacks.png';
    case 'dinner':
      return 'assets/images/scheduled_dinner.png';
    default:
      return 'assets/images/lunch.png';
  }
}
