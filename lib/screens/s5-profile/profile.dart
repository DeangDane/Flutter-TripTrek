import 'package:flutter/material.dart';
import '/data/mock_data.dart';
import 'package:triptrek/widgets/profile_header.dart' as ph;
import 'package:triptrek/widgets/profile_grid.dart' as pg;

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  Widget buildTopBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Center group: lock + name + arrow
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.lock, size: 18),
              const SizedBox(width: 10),
              Text(
                profileData['name'] as String,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const Icon(Icons.keyboard_arrow_down, size: 20),
              const SizedBox(width: 10),
            ],
          ),

          // Right-aligned menu icon
          const Positioned(right: 0, child: Icon(Icons.menu)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FA),
      body: ListView(
        children: [
          const SizedBox(height: 10),
          buildTopBar(),
          const SizedBox(height: 5),
          const ph.ProfileHeader(),
          const SizedBox(height: 5),
          const pg.ProfileGrid(),
        ],
      ),
    );
  }
}
