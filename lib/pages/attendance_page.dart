import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class AttendancePage extends StatefulWidget {
  const AttendancePage({super.key});

  @override
  State<AttendancePage> createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  DateTime _selectedDate = DateTime.now();
  final Map<DateTime, Map<String, dynamic>> _attendanceData = {
    DateTime(2025, DateTime.now().month, DateTime.now().day - 2): {
      'Breakfast': {'item': 'Poha', 'price': 30},
      'Lunch': {'item': 'Dal Chawal', 'price': 50},
      'Snacks': {'item': 'Tea + Biscuits', 'price': 20},
      'Dinner': {'item': 'Roti + Sabzi', 'price': 40},
    },
    DateTime(2025, DateTime.now().month, DateTime.now().day - 1): {
      'Breakfast': {'item': 'Sandwich', 'price': 40},
      'Lunch': {'item': 'Rajma Chawal', 'price': 60},
      'Snacks': {'item': 'Coffee + Pakora', 'price': 30},
      'Dinner': {'item': 'Not Taken', 'price': 0},
    },
    DateTime.now(): {
      'Breakfast': {'item': 'Idli Sambhar', 'price': 35},
      'Lunch': {'item': 'Not Taken', 'price': 0},
      'Snacks': {'item': 'Juice + Cake', 'price': 25},
      'Dinner': {'item': 'Not Taken', 'price': 0},
    },
  };

  final Map<String, bool> _mealSelection = {
    'Breakfast': true,
    'Lunch': true,
    'Snacks': true,
    'Dinner': false,
  };

  @override
  Widget build(BuildContext context) {
    final currentDayData = _attendanceData[_selectedDate] ?? {};
    final totalAmount = currentDayData.entries
        .fold(0, (sum, entry) => sum + (entry.value['price'] as int));

    return Scaffold(
      backgroundColor: const Color(0xFF0F0F0F),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section
              _buildHeaderSection(),
              const SizedBox(height: 24),

              // Date and Meal Selection Section
              _buildDateAndMealSelection(),
              const SizedBox(height: 24),

              // Calendar Section
              _buildCalendarSection(),
              const SizedBox(height: 24),

              // Meals Details Card
              _buildMealsDetailsCard(currentDayData, totalAmount),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderSection() {
    return Row(
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
                backgroundImage: AssetImage("assets/images/profile.png"),
                radius: 23,
              ),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Sehaj",
                  style: GoogleFonts.montserrat(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromRGBO(252, 240, 173, 1),
                  ),
                ),
                Text(
                  "Attendance Record",
                  style: GoogleFonts.montserrat(
                    fontSize: 14,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ],
        ),
        IconButton(
          icon: const Icon(Icons.notifications_rounded,
              color: Color.fromRGBO(255, 205, 41, 1)),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildDateAndMealSelection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          DateFormat('MMMM yyyy').format(_selectedDate),
          style: GoogleFonts.playfairDisplay(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              DateFormat('EEEE, d MMMM').format(_selectedDate),
              style: GoogleFonts.montserrat(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.white70,
              ),
            ),
            Row(
              children: [
                _buildMealToggle('B', 'Breakfast'),
                const SizedBox(width: 8),
                _buildMealToggle('L', 'Lunch'),
                const SizedBox(width: 8),
                _buildMealToggle('S', 'Snacks'),
                const SizedBox(width: 8),
                _buildMealToggle('D', 'Dinner'),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildMealToggle(String abbreviation, String meal) {
    final isSelected = _mealSelection[meal] ?? false;
    return GestureDetector(
      onTap: () {
        setState(() {
          _mealSelection[meal] = !isSelected;
        });
      },
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: isSelected
              ? const Color.fromRGBO(255, 183, 3, 0.2)
              : const Color(0xFF1A1A1A),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected
                ? const Color.fromRGBO(255, 183, 3, 1)
                : const Color(0xFF333333),
          ),
        ),
        child: Center(
          child: Text(
            abbreviation,
            style: GoogleFonts.montserrat(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: isSelected
                  ? const Color.fromRGBO(255, 183, 3, 1)
                  : Colors.white54,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCalendarSection() {
    return Column(
      children: [
        // Calendar Days Header
        Row(
          children: ['S', 'M', 'T', 'W', 'T', 'F', 'S']
              .map((day) => Expanded(
                    child: Center(
                      child: Text(
                        day,
                        style: GoogleFonts.roboto(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: const Color.fromRGBO(255, 183, 3, 1),
                        ),
                      ),
                    ),
                  ))
              .toList(),
        ),
        const SizedBox(height: 8),

        // Calendar Grid
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
            childAspectRatio: 1,
          ),
          itemCount:
              _daysInMonth(_selectedDate) + _firstDayOffset(_selectedDate),
          itemBuilder: (context, index) {
            if (index < _firstDayOffset(_selectedDate)) {
              return const SizedBox.shrink();
            }
            final day = index - _firstDayOffset(_selectedDate) + 1;
            final date = DateTime(_selectedDate.year, _selectedDate.month, day);
            final isSelected = _isSameDay(date, _selectedDate);
            final hasData =
                _attendanceData.keys.any((d) => _isSameDay(d, date));

            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedDate = date;
                });
              },
              child: Container(
                margin: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: isSelected
                      ? const Color.fromRGBO(255, 183, 3, 0.3)
                      : Colors.transparent,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isSelected
                        ? const Color.fromRGBO(255, 183, 3, 1)
                        : hasData
                            ? const Color.fromRGBO(255, 183, 3, 0.3)
                            : Colors.transparent,
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        day.toString(),
                        style: GoogleFonts.roboto(
                          fontSize: 16,
                          fontWeight:
                              isSelected ? FontWeight.bold : FontWeight.normal,
                          color: isSelected ? Colors.white : Colors.white70,
                        ),
                      ),
                      if (hasData)
                        Container(
                          margin: const EdgeInsets.only(top: 2),
                          width: 4,
                          height: 4,
                          decoration: const BoxDecoration(
                            color: Color.fromRGBO(255, 183, 3, 1),
                            shape: BoxShape.circle,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildMealsDetailsCard(
      Map<String, dynamic> currentDayData, int totalAmount) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: const Color(0xFF1A1A1A),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 10,
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
              Text(
                "Today's Meals",
                style: GoogleFonts.montserrat(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: const Color.fromRGBO(255, 183, 3, 1),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(255, 183, 3, 0.1),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: const Color.fromRGBO(255, 183, 3, 0.5),
                  ),
                ),
                child: Text(
                  "Total: ₹$totalAmount",
                  style: GoogleFonts.montserrat(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromRGBO(255, 183, 3, 1),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Divider(color: Color(0xFF333333), height: 1),
          const SizedBox(height: 12),
          ...['Breakfast', 'Lunch', 'Snacks', 'Dinner'].map((meal) {
            final mealData =
                currentDayData[meal] ?? {'item': 'Not Taken', 'price': 0};
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                children: [
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(255, 183, 3, 0.1),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: const Color.fromRGBO(255, 183, 3, 0.3),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        meal[0],
                        style: GoogleFonts.montserrat(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromRGBO(255, 183, 3, 1),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          meal,
                          style: GoogleFonts.montserrat(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          mealData['item'],
                          style: GoogleFonts.montserrat(
                            fontSize: 12,
                            color: mealData['item'] == 'Not Taken'
                                ? Colors.white54
                                : Colors.white70,
                            fontStyle: mealData['item'] == 'Not Taken'
                                ? FontStyle.italic
                                : FontStyle.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    mealData['price'] > 0 ? '₹${mealData['price']}' : '-',
                    style: GoogleFonts.montserrat(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: mealData['price'] > 0
                          ? const Color.fromRGBO(255, 183, 3, 1)
                          : Colors.white54,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ],
      ),
    );
  }

  int _daysInMonth(DateTime date) {
    return DateTime(date.year, date.month + 1, 0).day;
  }

  int _firstDayOffset(DateTime date) {
    return DateTime(date.year, date.month, 1).weekday - 1;
  }

  bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }
}
