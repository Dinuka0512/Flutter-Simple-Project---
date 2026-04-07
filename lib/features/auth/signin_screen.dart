import 'package:flutter/material.dart';
import 'package:frist_mobile_app/dto/auth_result.dart';
import 'package:frist_mobile_app/features/auth/login_screen.dart';
import 'package:frist_mobile_app/services/auth_service.dart';
import 'package:frist_mobile_app/utils/Validations.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController userEmailController = TextEditingController();
  final TextEditingController cPasswordController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _isPassword = true;
  bool _isCPassword = true;

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

                // Logo
                Image.network(
                  'https://res.cloudinary.com/dgokbm0dx/image/upload/v1775473752/vertex_miad2b.jpg',
                  height: 100,
                  width: 100,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.broken_image, size: 80, color: Colors.grey),
                ),

                const SizedBox(height: 20),

                const Text(
                  "Register Here",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFF2D3142)),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Create an account, It's Free",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),

                const SizedBox(height: 40),

                // User Name
                TextField(
                  controller: userNameController,
                  decoration: InputDecoration(
                    hintText: "User Name",
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Email
                TextField(
                  controller: userEmailController,
                  decoration: InputDecoration(
                    hintText: "Email",
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Confirm Password
                TextField(
                  controller: cPasswordController,
                  obscureText: _isCPassword,
                  decoration: InputDecoration(
                    hintText: "Confirm Password",
                    prefixIcon: const Icon(Icons.lock_outline_rounded, color: Color(0xFF2D3142)),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isCPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          _isCPassword = !_isCPassword;
                        });
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Password
                TextField(
                  controller: passwordController,
                  obscureText: _isPassword,
                  decoration: InputDecoration(
                    hintText: "Password",
                    prefixIcon: const Icon(Icons.lock_outline_rounded, color: Color(0xFF2D3142)),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          _isPassword = !_isPassword;
                        });
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),

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

                // Register Button
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () async {
                      String name = userNameController.text;
                      String email = userEmailController.text;
                      String cpassword = cPasswordController.text;
                      String password = passwordController.text;

                      // Empty fields
                      if (name.isEmpty || email.isEmpty || cpassword.isEmpty || password.isEmpty) {
                        _showAlert(context, "Error", "All fields are required..!");
                        return;
                      }

                      // Email validation
                      if (!Validators.isValidEmail(email)) {
                        _showAlert(context, "Warning", "Enter a valid Email...");
                        return;
                      }

                      // Password length
                      if (!Validators.isValidPassword(password)) {
                        _showAlert(context, "Error", "Password must be at least 6 characters long..!");
                        return;
                      }

                      // Password match
                      if (cpassword != password) {
                        _showAlert(context, "Error", "Passwords do not match...");
                        return;
                      }

                      //User Register Here 
                      AuthResult result = await AuthService.userRegister(name, email, password);
                      if(result.success){
                        // Show success alert and navigate only after OK
                        _showAlert(context, "Success", result.message, navigate: true);
                        clearAllFeildsWithoutNavigation();
                      }else{
                        _showAlert(context, "Error", result.message);
                      }                    
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2167E3),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      elevation: 0,
                    ),
                    child: const Text(
                      "Register",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account? ", style: TextStyle(color: Colors.grey)),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const LoginScreen()),
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

  void _showAlert(BuildContext context, String title, String message, {bool navigate = false}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // close dialog
                if (navigate) {
                  navigateToLoginPage(); // navigate only after OK
                }
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }
  
  void clearAllFeildsWithoutNavigation() {
    userNameController.clear();
    userEmailController.clear();
    cPasswordController.clear();
    passwordController.clear();
  }
  
  void navigateToLoginPage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context)=> const LoginScreen()) 
    );
  }
}
