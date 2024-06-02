import 'package:flutter/material.dart';
import 'package:translation_test/screens/home.dart';
import 'package:translation_test/screens/search.dart';
import 'package:translation_test/widgets/floating_bar.dart';
import 'package:translation_test/widgets/floating_bar_item.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orangeAccent),
        iconTheme: IconThemeData(color: Colors.brown.shade200),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _index = 2;

  static const List<Widget> _widgetOptions = <Widget>[
    SearchScreen(),
    Text(
      'Index 1',
    ),
    HomeScreen(),
    Text(
      'Index 3',
    ),
    Text(
      'Index 4',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Center(
        child: _widgetOptions.elementAt(_index),
      ),
      bottomNavigationBar: FloatingNavbar(
        backgroundColor: Colors.black87,
        borderRadius: 30,
        itemBorderRadius: 24,
        onTap: (int val) => setState(() => _index = val),
        currentIndex: _index,
        items: [
          FloatingNavbarItem(icon: Icons.search),
          FloatingNavbarItem(icon: Icons.message),
          FloatingNavbarItem(icon: Icons.home),
          FloatingNavbarItem(icon: Icons.favorite),
          FloatingNavbarItem(icon: Icons.person),
        ],
      ),
    );
  }
}
