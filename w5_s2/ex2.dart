import 'package:flutter/material.dart';

// Define the ProfileData and TileData models
class ProfileData {
  final String name;
  final String position;
  final String avatarUrl;
  final List<TileData> titles;

  ProfileData({
    required this.name,
    required this.position,
    required this.avatarUrl,
    required this.titles,
  });
}

class TileData {
  final IconData icon;
  final String title;
  final String data;

  TileData({
    required this.icon,
    required this.title,
    required this.data,
  });
}

// Main ProfileApp widget
class ProfileApp extends StatelessWidget {
  final ProfileData profileData;

  const ProfileApp({super.key, required this.profileData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CADT Student Profile'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profile Picture
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(profileData.avatarUrl),
            ),
            const SizedBox(height: 16),
            // Name
            Text(
              profileData.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            // Position
            Text(
              profileData.position,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 24),
            // List of TileData
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: profileData.titles.length,
              itemBuilder: (context, index) {
                final tile = profileData.titles[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    leading: Icon(tile.icon, color: Colors.blue),
                    title: Text(tile.title),
                    subtitle: Text(tile.data),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ProfileApp(
      profileData: ProfileData(
        name: 'Te Sakura',
        position: 'Student',
        avatarUrl:
            'assets/w4_s2/1.jpg',
        titles: [
          TileData(
            icon: Icons.phone,
            title: 'Phone Number',
            data: '+12 456 7890',
          ),
          TileData(
            icon: Icons.location_on,
            title: 'Address',
            data: 'Cambodia',
          ),
        ],
      ),
    ),
  ));
}
