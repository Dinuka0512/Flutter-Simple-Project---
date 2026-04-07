import 'package:flutter/material.dart';
import 'package:frist_mobile_app/features/ui/app_colors.dart';
import 'profile_page.dart';
import 'tasks_page.dart';
import 'attachments_page.dart';
import 'logs_page.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    Dashboard(), // main dashboard body
    LogsPage(),
    TasksPage(),
    AttachmentsPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.red,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            // handle drawer or menu
          },
        ),
        title: const Text("Dashboard"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                "https://res.cloudinary.com/dgokbm0dx/image/upload/v1775473752/vertex_miad2b.jpg",
              ),
            ),
          ),
        ],
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: AppColors.red,
        unselectedItemColor: AppColors.textLight,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: "Logs"),
          BottomNavigationBarItem(icon: Icon(Icons.task), label: "Tasks"),
          BottomNavigationBarItem(icon: Icon(Icons.attach_file), label: "Attachments"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
