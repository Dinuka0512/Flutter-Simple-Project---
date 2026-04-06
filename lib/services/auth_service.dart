import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:frist_mobile_app/dto/auth_result.dart';

class AuthService {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //Register
  static Future<AuthResult> userRegister(String name, String email, String password) async {
    try{
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
       User? user = result.user;

      if (user != null) {
        // Save extra info in Firestore
        await _firestore.collection('users').doc(user.uid).set({
          'name': name,
          'email': email,
          'createdAt': FieldValue.serverTimestamp(),
        });
      }

      return AuthResult(true, "Registration successful");
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'email-already-in-use':
          return AuthResult(false, "This email is already registered. Please log in.");
        case 'invalid-email':
          return AuthResult(false, "The email address is not valid.");
        case 'weak-password':
          return AuthResult(false, "The password is too weak.");
        case 'operation-not-allowed':
          return AuthResult(false, "Email/password accounts are not enabled.");
        default:
          return AuthResult(false, "Registration error: ${e.message}");
      }
    } catch (e) {
      return AuthResult(false, "Unexpected error: $e");
    }
  }

  //login
  static bool userLogin(String email, String password){
    return false;
  }
}