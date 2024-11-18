import 'package:flutter/material.dart';

class TemperatureScreen extends StatelessWidget {
  final VoidCallback onBack;

  const TemperatureScreen({super.key, required this.onBack});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.thermostat, size: 80, color: Colors.green),
          const SizedBox(height: 20),
          const Text(
            'Converter',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          const TextField(
            decoration: InputDecoration(
              labelText: 'Temperature in Celsius',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 10),
          const TextField(
            decoration: InputDecoration(
              labelText: 'Temperature in Fahrenheit',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: onBack,
            child: const Text('Back'),
          ),
        ],
      ),
    );
  }
}
