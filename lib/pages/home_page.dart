import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mess_app/components/home_page_meal_card.dart';
import 'package:mess_app/components/home_page_meal_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),

              // Top Greeting Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage:
                            AssetImage("assets/images/profile.png"),
                        radius: 23,
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Welcome back!",
                            style: GoogleFonts.averiaSerifLibre(
                              fontSize: 20,
                              height: 0.975,
                              color: Colors.white,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                "Sehaj ",
                                style: GoogleFonts.averiaSerifLibre(
                                  fontSize: 20,
                                  color: const Color.fromRGBO(252, 240, 173, 1),
                                ),
                              ),
                              const SizedBox(width: 4),
                              const Text("👋🏻",
                                  style: TextStyle(fontSize: 18)),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      const Icon(
                        Icons.notifications_rounded,
                        color: Color.fromRGBO(255, 205, 41, 1),
                        size: 29,
                      ),
                      Positioned(
                        right: 3,
                        top: 1,
                        child: Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 1.5),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Menu of the day
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "MENU",
                    style: GoogleFonts.jimNightshade(
                      color: const Color.fromRGBO(255, 183, 3, 1),
                      height: 0.95,
                      fontSize: 66,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    "of the day",
                    style: GoogleFonts.jimNightshade(
                      fontSize: 48,
                      height: 0.95,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              // Meals
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  mealHeader(context, "BREAKFAST"),
                  mealCard("Breakfast", "assets/images/breakfast.png"),
                  const SizedBox(height: 8),
                  mealHeader(context, "LUNCH"),
                  mealCard("Lunch", "assets/images/lunch.png"),
                  const SizedBox(height: 8),
                  mealHeader(context, "SNACKS"),
                  mealCard("Snacks", "assets/images/snacks.png",
                      isSelected: false),
                  const SizedBox(height: 8),
                  mealHeader(context, "DINNER"),
                  mealCard("Dinner", "assets/images/dinner.png"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
