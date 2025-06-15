import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mess_app/components/attendance_page_header.dart';

class AttendancePage extends StatefulWidget {
  const AttendancePage({super.key});

  @override
  State<AttendancePage> createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  DateTime _selectedDate = DateTime.now();
  DateTime _currentMonth = DateTime.now();
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

  @override
  Widget build(BuildContext context) {
    final currentDayData = _attendanceData[_selectedDate] ?? {};
    final totalAmount = currentDayData.entries
        .fold(0, (sum, entry) => sum + (entry.value['price'] as int));

    // Determine which meals were taken
    final hasBreakfast =
        (currentDayData['Breakfast']?['price'] ?? 0) > 0 ?? false;
    final hasLunch = (currentDayData['Lunch']?['price'] ?? 0) > 0 ?? false;
    final hasSnacks = (currentDayData['Snacks']?['price'] ?? 0) > 0 ?? false;
    final hasDinner = (currentDayData['Dinner']?['price'] ?? 0) > 0 ?? false;

    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section
              buildAttendancePageHeaderSection(),
              const SizedBox(height: 24),

              // Date and Meal Selection Section
              _buildDateAndMealSelection(
                  hasBreakfast, hasLunch, hasSnacks, hasDinner),
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

  Widget _buildDateAndMealSelection(
      bool hasBreakfast, bool hasLunch, bool hasSnacks, bool hasDinner) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              DateFormat('MMMM yyyy').format(_currentMonth),
              style: GoogleFonts.jimNightshade(
                fontSize: 33,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.chevron_left, color: Colors.white70),
                  onPressed: () {
                    setState(() {
                      _currentMonth =
                          DateTime(_currentMonth.year, _currentMonth.month - 1);
                    });
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.chevron_right, color: Colors.white70),
                  onPressed: () {
                    setState(() {
                      _currentMonth =
                          DateTime(_currentMonth.year, _currentMonth.month + 1);
                    });
                  },
                ),
              ],
            ),
          ],
        ),
        Divider(
          color: const Color.fromARGB(255, 64, 64, 64),
          height: 2,
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
                _buildMealIndicator('B', hasBreakfast),
                const SizedBox(width: 8),
                _buildMealIndicator('L', hasLunch),
                const SizedBox(width: 8),
                _buildMealIndicator('S', hasSnacks),
                const SizedBox(width: 8),
                _buildMealIndicator('D', hasDinner),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildMealIndicator(String abbreviation, bool isTaken) {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        color: isTaken
            ? const Color.fromRGBO(255, 183, 3, 0.2)
            : const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isTaken
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
            color:
                isTaken ? const Color.fromRGBO(255, 183, 3, 1) : Colors.white54,
          ),
        ),
      ),
    );
  }

  Widget _buildCalendarSection() {
    final firstDayOfMonth =
        DateTime(_currentMonth.year, _currentMonth.month, 1);
    final lastDayOfMonth =
        DateTime(_currentMonth.year, _currentMonth.month + 1, 0);
    final daysInMonth = lastDayOfMonth.day;
    final startingWeekday = firstDayOfMonth.weekday % 7 + 1;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color(0xFF1A1A1A),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
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
                            color: const Color.fromRGBO(255, 183, 3, 0.7),
                          ),
                        ),
                      ),
                    ))
                .toList(),
          ),
          const SizedBox(height: 12),

          // Calendar Grid
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              childAspectRatio: 1,
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
            ),
            itemCount: (startingWeekday - 1) + daysInMonth,
            itemBuilder: (context, index) {
              // Empty cells before the first day of the month
              if (index < startingWeekday - 1) {
                return const SizedBox.shrink();
              }

              final day = index - (startingWeekday - 1) + 1;
              final date =
                  DateTime(_currentMonth.year, _currentMonth.month, day);
              final isSelected = _isSameDay(date, _selectedDate);
              final isToday = _isSameDay(date, DateTime.now());
              final hasData =
                  _attendanceData.keys.any((d) => _isSameDay(d, date));

              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedDate = date;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: isSelected
                        ? const Color.fromRGBO(255, 183, 3, 0.3)
                        : isToday
                            ? const Color.fromRGBO(255, 183, 3, 0.1)
                            : Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: isSelected
                          ? const Color.fromRGBO(255, 183, 3, 1)
                          : isToday
                              ? const Color.fromRGBO(255, 183, 3, 0.5)
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
                            fontWeight: isSelected || isToday
                                ? FontWeight.bold
                                : FontWeight.normal,
                            color: isSelected
                                ? Colors.white
                                : isToday
                                    ? const Color.fromRGBO(255, 183, 3, 1)
                                    : hasData
                                        ? Colors.white70
                                        : Colors.white54,
                          ),
                        ),
                        if (hasData)
                          Container(
                            margin: const EdgeInsets.only(top: 2),
                            width: 6,
                            height: 6,
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? Colors.white
                                  : const Color.fromRGBO(255, 183, 3, 1),
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
      ),
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
                "Meal Details",
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
            final isTaken = mealData['price'] > 0;
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: isTaken
                          ? const Color.fromRGBO(255, 183, 3, 0.1)
                          : const Color(0xFF252525),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: isTaken
                            ? const Color.fromRGBO(255, 183, 3, 0.3)
                            : const Color(0xFF333333),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        meal[0],
                        style: GoogleFonts.montserrat(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: isTaken
                              ? const Color.fromRGBO(255, 183, 3, 1)
                              : Colors.white54,
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
                            color: isTaken ? Colors.white70 : Colors.white54,
                            fontStyle:
                                !isTaken ? FontStyle.italic : FontStyle.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: isTaken
                          ? const Color.fromRGBO(255, 183, 3, 0.1)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      isTaken ? '₹${mealData['price']}' : '-',
                      style: GoogleFonts.montserrat(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: isTaken
                            ? const Color.fromRGBO(255, 183, 3, 1)
                            : Colors.white54,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }

  bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }
}
