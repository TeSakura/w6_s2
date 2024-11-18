import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: ColorsApp()));
}

class ColorsApp extends StatelessWidget {
  ColorsApp({super.key});

  // List of colors to display
  final List<String> colors = ["red", "blue", "green"];

  // Method 3: Dedicated function to return a list of widgets
  List<Widget> generateColorLabels(List<String> colors) {
    return colors.map((color) => Label(text: color)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Colors Display Methods"),
      ),
      body: ListView(
        children: [
          // Method 1: Direct for loop
          const SectionHeader(title: "Method 1: Loop in Array"),
          Column(
            children: [
              for (var color in colors) Label(text: color),
            ],
          ),

          const SizedBox(height: 20),

          // Method 2: Using map()
          const SectionHeader(title: "Method 2: Map() in List"),
          Column(
            children: colors.map((color) => Label(text: color)).toList(),
          ),

          const SizedBox(height: 20),

          // Method 3: Dedicated function
          const SectionHeader(title: "Method 3: Dedicated Function"),
          Column(
            children: generateColorLabels(colors),
          ),
        ],
      ),
    );
  }
}

// Custom Label widget to render text in bold
class Label extends StatelessWidget {
  final String text;

  const Label({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Text(
        text,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}

// Section Header widget for better readability
class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue),
      ),
    );
  }
}
