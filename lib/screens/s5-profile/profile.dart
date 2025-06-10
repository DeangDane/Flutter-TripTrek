import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'edit_profile.dart';
import 'profile_menu.dart';

class JournalProfileScreen extends StatefulWidget {
  const JournalProfileScreen({super.key});

  @override
  State<JournalProfileScreen> createState() => _JournalProfileScreenState();
}

class _JournalProfileScreenState extends State<JournalProfileScreen> {
  String name = '';
  String username = '';
  String bio = '';

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString('name') ?? '';
      username = prefs.getString('username') ?? '';
      bio = prefs.getString('bio') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mina', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: const Icon(Icons.arrow_back_ios, color: Colors.black),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ProfileMenuScreen()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          const CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage('assets/images/mina.jpg'),
          ),
          const SizedBox(height: 8),
          const Text('54 Posts', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const EditProfileScreen()),
              );
              _loadData(); // refresh after returning
            },
            child: const Text('Edit'),
          ),
          const SizedBox(height: 16),
          Text(username, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(bio),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
