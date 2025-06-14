import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

Widget mealCard(String title, String imagePath, {bool isSelected = true}) {
  return Stack(
    children: [
      Container(
        height: 105,
        width: double.infinity,
        margin: const EdgeInsets.only(right: 6, left: 6, bottom: 20),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 2.5),
        decoration: BoxDecoration(
          color: Color(0xFF252525),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(22),
            bottomLeft: Radius.circular(22),
            topRight: Radius.circular(22),
            bottomRight: Radius.circular(88),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Meal image
            Image.asset(
              imagePath,
              height: 100,
              width: 100,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
      Positioned(
        right: 23,
        top: 68,
        child: isSelected
            ? CircleAvatar(
                radius: 12.5,
                backgroundColor: const Color.fromRGBO(91, 255, 82, 1),
                child: Icon(MingCute.check_2_line,
                    grade: 500, weight: 500, size: 22, color: Colors.black),
              )
            : const SizedBox.shrink(),
      ),
    ],
  );
}
