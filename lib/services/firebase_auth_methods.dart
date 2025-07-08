import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/utils/showSnackbar.dart'; // if you store showSnackBar separately

class FirebaseAuthMethods {
  final FirebaseAuth _auth;
  FirebaseAuthMethods(this._auth);

  // Get current user
  User get user => _auth.currentUser!;

  // Auth state stream
  Stream<User?> get authState => _auth.authStateChanges();

  // Email/Password Sign Up
  Future<void> signUpWithEmail({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      await sendEmailVerification(context);
      showSnackBar(context, "Signup successful. Please verify your email.");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showSnackBar(context, "Password too weak.");
      } else if (e.code == 'email-already-in-use') {
        showSnackBar(context, "Email already in use.");
      } else {
        showSnackBar(context, e.message ?? "Signup failed.");
      }
    }
  }

  // Send email verification
  Future<void> sendEmailVerification(BuildContext context) async {
    try {
      _auth.currentUser!.sendEmailVerification();
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
