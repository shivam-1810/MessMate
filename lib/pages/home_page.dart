import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mess_app/components/home_page_meal_card.dart';
import 'package:mess_app/components/home_page_meal_header.dart';
import 'package:mess_app/pages/attendance_page.dart';
import 'package:mess_app/pages/weekly_schedule_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F0F),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),

              // Top Greeting Row with improved styling
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: const Color.fromRGBO(255, 183, 3, 1),
                            width: 2,
                          ),
                        ),
                        child: const CircleAvatar(
                          backgroundColor: Colors.white,
                          backgroundImage:
                              AssetImage("assets/images/profile.png"),
                          radius: 23,
                        ),
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
                              color: Colors.white70,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                "Sehaj ",
                                style: GoogleFonts.averiaSerifLibre(
                                  fontSize: 20,
                                  color: const Color.fromRGBO(252, 240, 173, 1),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Text("👋🏻",
                                  style: TextStyle(fontSize: 18)),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xFF1E1E1E),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.notifications_rounded,
                            color: Color.fromRGBO(255, 205, 41, 1),
                            size: 29,
                          ),
                          onPressed: () {},
                        ),
                        Positioned(
                          right: 10,
                          top: 10,
                          child: Container(
                            width: 10,
                            height: 10,
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Today's Menu Card
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xFF1A1A1A),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      blurRadius: 15,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              "MENU",
                              style: GoogleFonts.jimNightshade(
                                color: const Color.fromRGBO(255, 183, 3, 1),
                                height: 0.95,
                                fontSize: 42,
                                shadows: [
                                  Shadow(
                                    blurRadius: 10,
                                    color: const Color.fromRGBO(255, 183, 3, 1)
                                        .withOpacity(0.3),
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              "of the day",
                              style: GoogleFonts.jimNightshade(
                                fontSize: 32,
                                height: 0.95,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
                          style: GoogleFonts.montserrat(
                            fontSize: 14,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.white30,
                      thickness: 1,
                      height: 20,
                    ),
                    const SizedBox(height: 10),
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

              const SizedBox(height: 25),

              // Billing Card
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFF242424),
                      Color(0xFF1A1A1A),
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      blurRadius: 15,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Billing Summary",
                          style: GoogleFonts.montserrat(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromRGBO(255, 183, 3, 1),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AttendancePage()));
                          },
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size.zero,
                          ),
                          child: Row(
                            children: [
                              Text(
                                "View More",
                                style: GoogleFonts.montserrat(
                                  fontSize: 14,
                                  color: Colors.white70,
                                ),
                              ),
                              const SizedBox(width: 4),
                              const Icon(
                                Icons.arrow_forward_ios,
                                size: 14,
                                color: Colors.white70,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Current Bill',
                                      style: GoogleFonts.montserrat(
                                        fontSize: 14,
                                        color: Colors.white70,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      '₹1,250',
                                      style: GoogleFonts.montserrat(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 12),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Pending Payment',
                                      style: GoogleFonts.montserrat(
                                        fontSize: 14,
                                        color: Colors.white70,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Row(
                                      children: [
                                        Text(
                                          'May : ',
                                          style: GoogleFonts.montserrat(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: const Color.fromARGB(
                                                255, 255, 223, 173),
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Text(
                                          '₹1,100',
                                          style: GoogleFonts.montserrat(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red.shade300,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 12),
                              ]),
                        ),
                        const SizedBox(width: 16),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            "assets/images/billing.png",
                            width: 105,
                            height: 105,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              // Weekly Schedule Card
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xFF1A1A1A),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      blurRadius: 15,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Weekly Schedule",
                      style: GoogleFonts.montserrat(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromRGBO(255, 183, 3, 1),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Check out this week's meal plan and schedule",
                      style: GoogleFonts.montserrat(
                        fontSize: 14,
                        color: Colors.white70,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            "assets/images/weekly_schedule.jpg",
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const WeeklyMenuScreen(
                                          menuList: [
                                            {
                                              'day': 'Monday',
                                              'menu':
                                                  'Rajma, Dal, Roti,\nChapati, Salad, Raita',
                                              'imagePath':
                                                  'assets/images/lunch.png',
                                            },
                                            {
                                              'day': 'Tuesday',
                                              'menu':
                                                  'Rajma, Dal, Roti,\nChapati, Salad, Raita',
                                              'imagePath':
                                                  'assets/images/lunch.png',
                                            },
                                            {
                                              'day': 'Wednesday',
                                              'menu':
                                                  'Rajma, Dal, Roti,\nChapati, Salad, Raita',
                                              'imagePath':
                                                  'assets/images/lunch.png',
                                            },
                                            {
                                              'day': 'Thursday',
                                              'menu':
                                                  'Rajma, Dal, Roti,\nChapati, Salad, Raita',
                                              'imagePath':
                                                  'assets/images/lunch.png',
                                            },
                                            {
                                              'day': 'Friday',
                                              'menu':
                                                  'Rajma, Dal, Roti,\nChapati, Salad, Raita',
                                              'imagePath':
                                                  'assets/images/lunch.png',
                                            },
                                            {
                                              'day': 'Saturday',
                                              'menu':
                                                  'Rajma, Dal, Roti,\nChapati, Salad, Raita',
                                              'imagePath':
                                                  'assets/images/lunch.png',
                                            },
                                            {
                                              'day': 'Sunday',
                                              'menu':
                                                  'Rajma, Dal, Roti,\nChapati, Salad, Raita',
                                              'imagePath':
                                                  'assets/images/lunch.png',
                                            },
                                          ],
                                        )));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromRGBO(255, 183, 3, 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 12),
                          ),
                          child: Text(
                            "View Schedule",
                            style: GoogleFonts.montserrat(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
