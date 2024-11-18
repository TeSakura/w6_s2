import 'package:flutter/material.dart';
import 'screen/welcome.dart';
import 'screen/temperature.dart';

void main() {
  runApp(const MaterialApp(home: TemperatureApp()));
}

class TemperatureApp extends StatefulWidget {
  const TemperatureApp({super.key});

  @override
  State<TemperatureApp> createState() => _TemperatureAppState();
}

class _TemperatureAppState extends State<TemperatureApp> {
  // State to track the current screen
  bool isWelcomeScreen = true;

  // Function to switch screens
  void switchScreen() {
    setState(() {
      isWelcomeScreen = !isWelcomeScreen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isWelcomeScreen
          ? WelcomeScreen(onStart: switchScreen)
          : TemperatureScreen(onBack: switchScreen),
    );
  }
}
