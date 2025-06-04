import 'package:flutter/material.dart';
import 'package:triptrek/widgets/journal_post.dart';
import 'package:triptrek/widgets/story_section.dart';
import 'createpost.dart';

class JournalScreen extends StatefulWidget {
  const JournalScreen({super.key});

  @override
  State<JournalScreen> createState() => _JournalScreenState();
}

class _JournalScreenState extends State<JournalScreen> {
  final List<Map<String, dynamic>> posts = [
    {
      'author': 'Sarah Verold',
      'location': 'Kep Province, Cambodia',
      'images': [
        'assets/images/journal1.png',
        'assets/images/journal2.png',
        'assets/images/journal3.png',
      ],
      'likes': 'craig_love',
      'likeCount': '44,686',
      'username': 'joshua_l',
      'caption':
          'The game in Cambodia was amazing and I want to share some photos 😊',
      'date': 'September 19',
    },
  ];

  void _showComments() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder:
          (_) => const SizedBox(
            height: 300,
            child: Center(child: Text('Comment sheet here')),
          ),
    );
  }

  void _navigateToCreatePost() async {
    final newPost = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const CreatePost()),
    );

    if (newPost != null && newPost is Map<String, dynamic>) {
      setState(() {
        posts.insert(0, newPost);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Journal',
          style: TextStyle(
            color: Colors.teal,
            fontFamily: 'Serif',
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          const Icon(Icons.notifications_none, color: Colors.teal),
          const SizedBox(width: 12),
          IconButton(
            icon: const Icon(Icons.add_circle_outline, color: Colors.teal),
            onPressed: _navigateToCreatePost,
          ),
          const SizedBox(width: 12),
          const Icon(Icons.search, color: Colors.teal),
          const SizedBox(width: 12),
        ],
      ),
      body: ListView(
        children: [
          const StorySection(),
          ...posts.map(
            (post) => JournalPost(data: post, onCommentTap: _showComments),
          ),
        ],
      ),
    );
  }
}
