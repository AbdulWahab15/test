import 'package:flutter/material.dart';
import 'package:translation_test/screens/home.dart';
import 'package:translation_test/screens/search.dart';
import 'package:translation_test/widgets/floating_bar.dart';
import 'package:translation_test/widgets/floating_bar_item.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
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
