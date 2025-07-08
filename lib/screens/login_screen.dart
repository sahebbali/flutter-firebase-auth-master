import 'package:firebase_auth/screens/login_email_password_screen.dart';
import 'package:firebase_auth/screens/phone_screen.dart';
import 'package:firebase_auth/screens/signup_email_password_screen.dart';
import 'package:firebase_auth/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Welcome"), centerTitle: true),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.lock, size: 80, color: Colors.blueAccent),
                const SizedBox(height: 20),
                const Text(
                  "Login Options",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 40),
                CustomButton(
                  onTap: () {
                    Navigator.pushNamed(context, EmailPasswordSignup.routeName);
                  },
                  text: 'Email / Password Sign Up',
                ),
                const SizedBox(height: 12),
                CustomButton(
                  onTap: () {
                    Navigator.pushNamed(context, EmailPasswordLogin.routeName);
                  },
                  text: 'Email / Password Login',
                ),
                const SizedBox(height: 12),
                CustomButton(
                  onTap: () {
                    Navigator.pushNamed(context, PhoneScreen.routeName);
                  },
                  text: 'Phone Sign In',
                ),
                const SizedBox(height: 12),
                CustomButton(
                  onTap: () {
                    // context.read<FirebaseAuthMethods>().signInWithGoogle(context);
                  },
                  text: 'Google Sign In',
                ),
                const SizedBox(height: 12),
                CustomButton(
                  onTap: () {
                    // context.read<FirebaseAuthMethods>().signInWithFacebook(context);
                  },
                  text: 'Facebook Sign In',
                ),
                const SizedBox(height: 12),
                CustomButton(
                  onTap: () {
                    // context.read<FirebaseAuthMethods>().signInAnonymously(context);
                  },
                  text: 'Anonymous Sign In',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
