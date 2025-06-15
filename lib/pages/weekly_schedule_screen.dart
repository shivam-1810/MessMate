import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mess_app/components/weekly_schedule_card.dart';
import 'package:mess_app/pages/base_page.dart';

class WeeklyMenuScreen extends StatefulWidget {
  final List<Map<String, String>> menuList = [
    {
      'day': 'Monday',
      'Breakfast': 'Poha + Tea',
      'Lunch': 'Dal Chawal + Sabzi + Salad',
      'Snacks': 'Sandwich + Juice',
      'Dinner': 'Roti + Paneer Butter Masala',
    },
    {
      'day': 'Tuesday',
      'Breakfast': 'Idli Sambhar',
      'Lunch': 'Rajma Chawal + Dahi',
      'Snacks': 'Pakora + Tea',
      'Dinner': 'Chole Bhature',
    },
    {
      'day': 'Wednesday',
      'Breakfast': 'Paratha + Curd',
      'Lunch': 'Vegetable Biryani + Raita',
      'Snacks': 'Cake + Milk',
      'Dinner': 'Mix Veg + Roti',
    },
    {
      'day': 'Thursday',
      'Breakfast': 'Cornflakes + Milk',
      'Lunch': 'Kadhi Chawal + Papad',
      'Snacks': 'Samosa + Chutney',
      'Dinner': 'Dal Tadka + Jeera Rice',
    },
    {
      'day': 'Friday',
      'Breakfast': 'Upma + Coffee',
      'Lunch': 'Sambar Rice + Fryums',
      'Snacks': 'Bread Pakora + Tea',
      'Dinner': 'Aloo Paratha + Curd',
    },
    {
      'day': 'Saturday',
      'Breakfast': 'Dosa + Chutney',
      'Lunch': 'Veg Pulao + Boondi Raita',
      'Snacks': 'Pasta + Cold Coffee',
      'Dinner': 'Dal Makhani + Naan',
    },
    {
      'day': 'Sunday',
      'Breakfast': 'Aloo Puri + Halwa',
      'Lunch': 'Thali (Roti, Rice, 3 Sabzis, Salad, Sweet)',
      'Snacks': 'Pizza + Soft Drink',
      'Dinner': 'Fried Rice + Manchurian',
    },
  ];

  WeeklyMenuScreen({
    super.key,
  });

  @override
  State<WeeklyMenuScreen> createState() => _WeeklyMenuScreenState();
}

class _WeeklyMenuScreenState extends State<WeeklyMenuScreen> {
  int _selectedMealType = 0;
  final PageController _pageController = PageController();
  final List<String> _mealTypes = ['Breakfast', 'Lunch', 'Snacks', 'Dinner'];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title Section
            Center(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Back Button with smooth transition
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () => BasePage.clearScreen(),
                      ),
                      Text(
                        "Weekly Menu",
                        style: GoogleFonts.pacifico(
                          color: const Color.fromRGBO(255, 183, 3, 1),
                          fontSize: 32,
                        ),
                      ),
                      // Invisible IconButton for symmetry
                      const Opacity(
                        opacity: 0,
                        child: IconButton(
                          icon: Icon(Icons.arrow_back),
                          onPressed: null,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 7.5),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 2,
                          color: Colors.white38,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Text(
                          _mealTypes[_selectedMealType].toUpperCase(),
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                            fontSize: 22,
                            color: Colors.white,
                            letterSpacing: 1.5,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 2,
                          color: Colors.white38,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Meal Type Selector
            SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _mealTypes.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _selectedMealType = index;
                        });
                        _pageController.animateToPage(
                          index,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          color: _selectedMealType == index
                              ? const Color.fromRGBO(255, 183, 3, 1)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(
                            color: const Color.fromRGBO(255, 183, 3, 0.5),
                            width: 1.5,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            _mealTypes[index],
                            textAlign: TextAlign.center,
                            style: GoogleFonts.montserrat(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: _selectedMealType == index
                                  ? Colors.black
                                  : Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            // Menu Grid with PageView for swipe functionality
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _selectedMealType = index;
                  });
                },
                itemCount: _mealTypes.length,
                itemBuilder: (context, pageIndex) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: GridView.builder(
                      itemCount: widget.menuList.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.76,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 20,
                      ),
                      itemBuilder: (context, index) {
                        final meal = widget.menuList[index];
                        // Responsive sizing
                        final screenWidth = MediaQuery.of(context).size.width;
                        final screenHeight = MediaQuery.of(context).size.height;
                        final containerWidth = (screenWidth - 16 - 18 * 2) / 2;
                        final containerHeight = screenHeight * 200 / 917;

                        return weeklyScheduleCard(
                          menuList: meal,
                          mealType: _mealTypes[_selectedMealType],
                          containerWidth: containerWidth,
                          containerHeight: containerHeight,
                        );
                      },
                    ),
                  );
                },
              ),
            ),

            // Page indicator
            Padding(
              padding: const EdgeInsets.only(top: 13, bottom: 3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  _mealTypes.length,
                  (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: _selectedMealType == index ? 20 : 8,
                    height: 8,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: _selectedMealType == index
                          ? const Color.fromRGBO(255, 183, 3, 1)
                          : const Color.fromRGBO(255, 183, 3, 0.4),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
