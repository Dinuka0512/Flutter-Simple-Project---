import 'package:flutter/material.dart';
import 'package:frist_mobile_app/common/app_colors.dart';

class Students extends StatelessWidget {
  const Students({super.key});

  @override
  Widget build(BuildContext context) {
    // 🔹 Dummy data
    final students = [
      {"id": "1", "name": "Dinuka", "email": "dinuka@example.com"},
      {"id": "2", "name": "Kasun", "email": "kasun@example.com"},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Manage Students",
          style: TextStyle(
            fontSize: 18, // Made smaller
            fontWeight: FontWeight.w500,
            color: AppColors.textDark,
            letterSpacing: 0.5,
          ),
        ),
        backgroundColor: AppColors.background,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.background),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: ElevatedButton.icon(
              onPressed: () {
                _showAddStudentDialog(context);
              },
              icon: const Icon(Icons.add, color: AppColors.background, size: 18),
              label: const Text(
                "Add New",
                style: TextStyle(
                  color: AppColors.background,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.red,
                elevation: 0,
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: const BorderSide(color: AppColors.background, width: 1),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        color: AppColors.background,
        child: students.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.school_outlined,
                      size: 80,
                      color: AppColors.textLight,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "No students yet",
                      style: TextStyle(
                        fontSize: 18,
                        color: AppColors.textLight,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Tap 'Add New' to get started",
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.textLight,
                      ),
                    ),
                  ],
                ),
              )
            : ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: students.length,
                itemBuilder: (context, index) {
                  final student = students[index];

                  return Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () {
                        // Could add navigation to student details
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Modern Avatar
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: AppColors.textLight.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(
                                  color: AppColors.red.withOpacity(0.3),
                                  width: 2,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  student["name"]![0].toUpperCase(),
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.red,
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(width: 16),

                            // Student info
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    student["name"]!,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.textDark,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    student["email"]!,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: AppColors.textLight,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // Menu button
                            IconButton(
                              onPressed: () {
                                _showStudentMenu(context, student);
                              },
                              icon: Icon(
                                Icons.more_vert,
                                color: AppColors.textLight,
                                size: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }

  // 🔹 Student Menu
  void _showStudentMenu(BuildContext context, Map<String, String> student) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.background,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.edit, color: AppColors.textDark),
                title: Text(
                  "Edit Student",
                  style: TextStyle(color: AppColors.textDark),
                ),
                onTap: () {
                  Navigator.pop(context);
                  _showEditDialog(context, student);
                },
              ),
              ListTile(
                leading: const Icon(Icons.delete, color: AppColors.red),
                title: Text(
                  "Delete Student",
                  style: TextStyle(color: AppColors.textDark),
                ),
                onTap: () {
                  Navigator.pop(context);
                  _showDeleteDialog(context, student["id"]!);
                },
              ),
              ListTile(
                leading: const Icon(Icons.image, color: AppColors.textDark),
                title: Text(
                  "Update Image",
                  style: TextStyle(color: AppColors.textDark),
                ),
                onTap: () {
                  Navigator.pop(context);
                  print("Update Image ${student["id"]}");
                },
              ),
            ],
          ),
        );
      },
    );
  }

  // 🔹 Add Student Dialog
  void _showAddStudentDialog(BuildContext context) {
    final nameController = TextEditingController();
    final emailController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.background,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Text(
            "Add Student",
            style: TextStyle(color: AppColors.textDark),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                style: TextStyle(color: AppColors.textDark),
                decoration: InputDecoration(
                  labelText: "Name",
                  labelStyle: TextStyle(color: AppColors.textLight),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.border),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.red),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: emailController,
                style: TextStyle(color: AppColors.textDark),
                decoration: InputDecoration(
                  labelText: "Email",
                  labelStyle: TextStyle(color: AppColors.textLight),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.border),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.red),
                  ),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                "Cancel",
                style: TextStyle(color: AppColors.textLight),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                String name = nameController.text;
                String email = emailController.text;

                // 🔥 POST /api/v1/students
                print("Add Student: $name - $email");

                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.red,
                foregroundColor: AppColors.background,
              ),
              child: const Text("Save"),
            ),
          ],
        );
      },
    );
  }

  // 🔹 Edit Dialog
  void _showEditDialog(BuildContext context, Map<String, String> student) {
    final nameController = TextEditingController(text: student["name"]);
    final emailController = TextEditingController(text: student["email"]);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.background,
          title: Text(
            "Edit Student",
            style: TextStyle(color: AppColors.textDark),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                style: TextStyle(color: AppColors.textDark),
                decoration: InputDecoration(
                  labelStyle: TextStyle(color: AppColors.textLight),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.border),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.red),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: emailController,
                style: TextStyle(color: AppColors.textDark),
                decoration: InputDecoration(
                  labelStyle: TextStyle(color: AppColors.textLight),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.border),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.red),
                  ),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                "Cancel",
                style: TextStyle(color: AppColors.textLight),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // 🔥 PUT /api/v1/students/{id}
                print("Update ${student["id"]}");

                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.red,
                foregroundColor: AppColors.background,
              ),
              child: const Text("Update"),
            ),
          ],
        );
      },
    );
  }

  // 🔹 Delete Confirmation
  void _showDeleteDialog(BuildContext context, String id) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.background,
          title: Text(
            "Delete Student",
            style: TextStyle(color: AppColors.textDark),
          ),
          content: Text(
            "Are you sure you want to delete this student?",
            style: TextStyle(color: AppColors.textLight),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                "Cancel",
                style: TextStyle(color: AppColors.textLight),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // 🔥 DELETE /api/v1/students/{id}
                print("Delete $id");

                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.red,
                foregroundColor: AppColors.background,
              ),
              child: const Text("Delete"),
            ),
          ],
        );
      },
    );
  }
}