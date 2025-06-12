import 'package:flutter/material.dart';
import 'package:mess_app/pages/weekly_schedule_screen.dart';

class SchedulePage extends StatelessWidget {
  const SchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    return WeeklyMenuScreen(
      title: "LUNCH",
      menuList: [
        {
          'day': 'Monday',
          'menu': 'Rajma, Dal, Roti,\nChapati, Salad, Raita',
          'imagePath': 'assets/images/lunch.png',
        },
        {
          'day': 'Tuesday',
          'menu': 'Rajma, Dal, Roti,\nChapati, Salad, Raita',
          'imagePath': 'assets/images/lunch.png',
        },
        {
          'day': 'Wednesday',
          'menu': 'Rajma, Dal, Roti,\nChapati, Salad, Raita',
          'imagePath': 'assets/images/lunch.png',
        },
        {
          'day': 'Thursday',
          'menu': 'Rajma, Dal, Roti,\nChapati, Salad, Raita',
          'imagePath': 'assets/images/lunch.png',
        },
        {
          'day': 'Friday',
          'menu': 'Rajma, Dal, Roti,\nChapati, Salad, Raita',
          'imagePath': 'assets/images/lunch.png',
        },
        {
          'day': 'Saturday',
          'menu': 'Rajma, Dal, Roti,\nChapati, Salad, Raita',
          'imagePath': 'assets/images/lunch.png',
        },
        {
          'day': 'Sunday',
          'menu': 'Rajma, Dal, Roti,\nChapati, Salad, Raita',
          'imagePath': 'assets/images/lunch.png',
        },
      ],
    );
  }
}
