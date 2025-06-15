import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:mess_app/pages/attendance_page.dart';
import 'package:mess_app/pages/home_page.dart';
import 'package:mess_app/pages/payments_page.dart';
import 'package:mess_app/pages/profile_page.dart';

class BasePage extends StatefulWidget {
  static final GlobalKey<_BasePageState> globalKey =
      GlobalKey<_BasePageState>();

  const BasePage({super.key});

  @override
  State<BasePage> createState() => _BasePageState();

  /// Show any screen with nav bar intact
  static void showScreen(Widget page) {
    globalKey.currentState?._showScreen(page);
  }

  /// Go back to tab layout if needed (optional)
  static void clearScreen() {
    globalKey.currentState?._clearScreen();
  }

  static void switchTab(int index) {
    globalKey.currentState?._changePage(index);
  }
}

class _BasePageState extends State<BasePage> {
  int _currentPageIndex = 0;
  Widget? _currentScreen;

  final List<Widget> _pages = [
    HomePage(),
    AttendancePage(),
    PaymentsPage(),
    ProfilePage(),
  ];

  void _showScreen(Widget page) {
    setState(() {
      _currentScreen = page;
    });
  }

  void _changePage(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  void _clearScreen() {
    setState(() {
      _currentScreen = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F0F),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: _currentScreen ?? _pages[_currentPageIndex],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: const Color(0xFF0F0F0F),
        color: const Color.fromARGB(95, 51, 51, 51),
        buttonBackgroundColor: const Color.fromARGB(115, 91, 91, 91),
        height: 62,
        index: _currentPageIndex,
        items: const [
          Icon(Icons.home_rounded, color: Colors.white),
          Icon(Icons.calendar_month_rounded, color: Colors.white),
          Icon(Icons.payment_rounded, color: Colors.white),
          Icon(Icons.person_rounded, color: Colors.white),
        ],
        onTap: (index) {
          setState(() {
            _currentPageIndex = index;
            _currentScreen = null;
          });
        },
      ),
    );
  }
}
