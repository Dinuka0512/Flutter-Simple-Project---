import 'package:flutter/material.dart';
import 'package:frist_mobile_app/features/ui/app_colors.dart';

class AttachmentsPage extends StatelessWidget {
  const AttachmentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Attachments"), backgroundColor: AppColors.red
      ),
      body: const Center(child: Text("Attachments Page Content")),
    );
  }
}
