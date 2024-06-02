import 'package:flutter/material.dart';
import 'package:translation_test/widgets/bottom_nav_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter UI Test',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orangeAccent),
        iconTheme: IconThemeData(color: Colors.brown.shade200),
        useMaterial3: true,
      ),
      home: const BottomNavBar(),
    );
  }
}
