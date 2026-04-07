import 'package:flutter/material.dart';
import 'package:frist_mobile_app/features/ui/app_colors.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile"), backgroundColor: AppColors.red),
      body: const Center(child: Text("Profile Page Content")),
    );
  }
}
