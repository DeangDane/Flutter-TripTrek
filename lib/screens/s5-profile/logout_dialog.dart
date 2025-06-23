// lib/screens/s5-profile/logout_dialog.dart
import 'package:flutter/material.dart';

class LogoutConfirmationDialog extends StatelessWidget {
  const LogoutConfirmationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Logout',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      content: const Text('Are you sure to logout this account'),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            // Add your logout logic here
            Navigator.pop(context);
          },
          child: const Text('Logout'),
        ),
      ],
    );
  }
}
