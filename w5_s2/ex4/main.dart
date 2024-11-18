import 'package:flutter/material.dart';
import 'jokes.dart';

void main() {
  runApp(const MaterialApp(home: JokesApp()));
}

class JokesApp extends StatefulWidget {
  const JokesApp({super.key});

  @override
  State<JokesApp> createState() => _JokesAppState();
}

class _JokesAppState extends State<JokesApp> {
  int? favoriteIndex; // Tracks the index of the favorite joke

  // Update the favorite joke
  void updateFavorite(int index) {
    setState(() {
      favoriteIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Jokes'),
      ),
      body: ListView.builder(
        itemCount: jokes.length,
        itemBuilder: (context, index) {
          return JokeCard(
            joke: jokes[index],
            isFavorite: favoriteIndex == index,
            onFavorite: () => updateFavorite(index),
          );
        },
      ),
    );
  }
}

class JokeCard extends StatelessWidget {
  final Joke joke;
  final bool isFavorite;
  final VoidCallback onFavorite;

  const JokeCard({
    super.key,
    required this.joke,
    required this.isFavorite,
    required this.onFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        title: Text(joke.title),
        subtitle: Text(joke.description),
        trailing: IconButton(
          icon: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border,
            color: isFavorite ? Colors.red : Colors.grey,
          ),
          onPressed: onFavorite,
        ),
      ),
    );
  }
}

