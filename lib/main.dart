import 'package:flutter/material.dart';
import 'features/auth/Presentation/login_screen.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      // This is where you call the LoginScreen widget
      home: const LoginScreen(), 
    );
  }
}