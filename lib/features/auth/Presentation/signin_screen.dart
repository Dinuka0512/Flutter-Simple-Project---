import 'package:flutter/material.dart';
import 'package:frist_mobile_app/features/auth/Presentation/login_screen.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 10),
                
                // 1. Logo
                Image.network(
                  'https://res.cloudinary.com/dgokbm0dx/image/upload/v1775473752/vertex_miad2b.jpg',
                  height: 100,
                  width: 100,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) => 
                      const Icon(Icons.broken_image, size: 80, color: Colors.grey),
                ),

                const SizedBox(height: 20),
                
                // 2. Titles
                const Text(
                  "Register Here",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFF2D3142)),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Create an account, Its Free",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),

                const SizedBox(height: 40),

                // 3. Email Field
                TextField(
                  decoration: InputDecoration(
                    hintText: "User Name",
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.black12),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.black12),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // 3. Email Field
                TextField(
                  decoration: InputDecoration(
                    hintText: "Email",
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.black12),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.black12),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // 4. Password Field with Icons
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Conform Password",
                    prefixIcon: const Icon(Icons.lock_outline_rounded, color: Color(0xFF2D3142)),
                    suffixIcon: const Icon(Icons.visibility_outlined, color: Colors.grey),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.black12),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.black12),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // 4. Password Field with Icons
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Password",
                    prefixIcon: const Icon(Icons.lock_outline_rounded, color: Color(0xFF2D3142)),
                    suffixIcon: const Icon(Icons.visibility_outlined, color: Colors.grey),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.black12),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.black12),
                    ),
                  ),
                ),

                // 5. Forgot Password
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Forgot Password?",
                      style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // 6. Login Button
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () {
                      
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2167E3), // Match the blue in image
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      elevation: 0,
                    ),
                    child: const Text(
                      "Register",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                ),

                const SizedBox(height: 20), // Spacer for bottom text

                // 7. Footer text
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Allready have an account? ", style: TextStyle(color: Colors.grey)),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context)=> LoginScreen()),
                        );
                      },
                      child: const Text(
                        "Log In",
                        style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}