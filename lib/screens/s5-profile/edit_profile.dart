// lib/screens/s5-profile/edit_profile.dart
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final nameController = TextEditingController();
  final usernameController = TextEditingController();
  final bioController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final genderController = TextEditingController();
  File? _image;

  @override
  void initState() {
    super.initState();
    _loadSavedData();
  }

  Future<void> _loadSavedData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      nameController.text = prefs.getString('name') ?? '';
      usernameController.text = prefs.getString('username') ?? '';
      bioController.text = prefs.getString('bio') ?? '';
      emailController.text = prefs.getString('email') ?? '';
      phoneController.text = prefs.getString('phone') ?? '';
      genderController.text = prefs.getString('gender') ?? '';
      final imagePath = prefs.getString('profile_image');
      if (imagePath != null) {
        _image = File(imagePath);
      }
    });
  }

  Future<void> _saveProfile() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', nameController.text);
    await prefs.setString('username', usernameController.text);
    await prefs.setString('bio', bioController.text);
    await prefs.setString('email', emailController.text);
    await prefs.setString('phone', phoneController.text);
    await prefs.setString('gender', genderController.text);
    if (_image != null) {
      await prefs.setString('profile_image', _image!.path);
    }
    if (mounted) Navigator.pop(context);
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        _image = File(picked.path);
      });
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    usernameController.dispose();
    bioController.dispose();
    emailController.dispose();
    phoneController.dispose();
    genderController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8FC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel', style: TextStyle(color: Colors.black)),
        ),
        centerTitle: true,
        title: const Text(
          'Edit Profile',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          TextButton(
            onPressed: _saveProfile,
            child: const Text('Done', style: TextStyle(color: Colors.green)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundColor: Colors.purpleAccent,
              backgroundImage:
                  _image != null
                      ? FileImage(_image!)
                      : const AssetImage('assets/images/mina.jpg')
                          as ImageProvider,
            ),
            const SizedBox(height: 8),
            TextButton(
              onPressed: _pickImage,
              child: const Text(
                'Change Profile Photo',
                style: TextStyle(color: Colors.cyan),
              ),
            ),
            const SizedBox(height: 16),
            _buildTextField('Name', nameController),
            _buildTextField('Username', usernameController),
            _buildTextField('Bio', bioController),
            const SizedBox(height: 16),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Private Information',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            _buildTextField('Email', emailController),
            _buildTextField('Phone', phoneController),
            _buildTextField('Gender', genderController),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Text(label, style: const TextStyle(fontSize: 14)),
        TextField(controller: controller),
      ],
    );
  }
}
