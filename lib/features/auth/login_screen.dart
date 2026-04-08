import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frist_mobile_app/dto/auth_result.dart';
import 'package:frist_mobile_app/features/auth/signin_screen.dart';
import 'package:frist_mobile_app/features/dashboard/dashboard_Layout.dart';
import 'package:frist_mobile_app/common/app_colors.dart';
import 'package:frist_mobile_app/services/auth_service.dart';
import 'package:frist_mobile_app/utils/Validations.dart';
import 'package:frist_mobile_app/providers/auth_providers.dart';

final TextEditingController userEmailContro = TextEditingController();
final TextEditingController userPwController = TextEditingController();

class LoginScreen extends ConsumerWidget {  
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.background,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                
                // 1. Logo
                Image.network(
                  'https://res.cloudinary.com/dgokbm0dx/image/upload/v1775473752/vertex_miad2b.jpg',
                  height: 100,
                  width: 100,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) => 
                      const Icon(Icons.broken_image, size: 80, color: AppColors.textLight),
                ),

                const SizedBox(height: 20),
                
                // 2. Titles
                const Text(
                  "Welcome Back",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: AppColors.textDark),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Login to continue",
                  style: TextStyle(fontSize: 16, color: AppColors.textLight),
                ),

                const SizedBox(height: 40),

                // 3. Email Field
                TextField(
                  controller: userEmailContro,
                  decoration: InputDecoration(
                    hintText: "Email or Username",
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: AppColors.border),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: AppColors.border),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // 4. Password Field with Icons
                TextField(
                  controller: userPwController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Password",
                    prefixIcon: const Icon(Icons.lock_outline_rounded, color: AppColors.textDark),
                    suffixIcon: const Icon(Icons.visibility_outlined, color: AppColors.textLight),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: AppColors.border),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: AppColors.border),
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
                      style: TextStyle(color: AppColors.red, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // 6. Login Button
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () async {
                      String email = userEmailContro.text;
                      String password = userPwController.text;

                      //Frist check is both are not null
                      if(email.isEmpty || password.isEmpty){
                        _showAlert(context, "Error", "All fields are required..!");
                        return;
                      }

                      if(!Validators.isValidEmail(email)){
                        _showAlert(context, "Error", "Enter the valid email..");
                        return;
                      }

                      //if all ok need to call login 
                      AuthResult result = await AuthService.userLogin(email, password);
                      
                      if (result.success) {
                        //HERE NEED TO GET THE USER DATA AND NEED TO MAKE THAT ACCESIBLE ON APPLYCATION ANY WERE....
                        //USEING RIVERPOD... 
                        //HERE HAVE SET THE EMAIL - with the riverpod stateManager..
                        ref.read(emailProvider.notifier).state = email;
                        navigateToLoginPage(context);
                      } else {
                        _showAlert(context, "Login Failed", result.message);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.red, // Match the blue in image
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      elevation: 0,
                    ),
                    child: const Text(
                      "Login",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.background),
                    ),
                  ),
                ),

                const SizedBox(height: 120), // Spacer for bottom text

                // 7. Footer text
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account? ", style: TextStyle(color: AppColors.textLight)),
                    GestureDetector(
                      onTap: () {
                        // Navigate to SignUp
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context)=> SigninScreen()),
                        );
                      },
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(color: AppColors.red, fontWeight: FontWeight.bold),
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
                  navigateToLoginPage(context); // navigate only after OK
                }
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  void navigateToLoginPage(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context)=> const Dashboard()) 
    );
  }
}