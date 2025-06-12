import 'package:flutter/material.dart';
import 'package:mess_app/pages/lets_start_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mess Mate',
      theme: ThemeData(
        colorScheme: ThemeData.dark().colorScheme,
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const LetsStartPage(),
    );
  }
}
