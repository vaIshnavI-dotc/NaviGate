import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const NaviGateApp());
}

class NaviGateApp extends StatelessWidget {
  const NaviGateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NaviGate',
      home: const HomeScreen(),
    );
  }
}