import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myauthtute/home_page.dart';
import 'package:myauthtute/login_page.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }
          // user is logged in
          else if (snapshot.hasData) {
            return HomePage();
          } else if (snapshot.hasError) {
            return const Center(child: Text('Something Went Wrong!'));
          }

          // user is NOT logged in
          else {
            return const LoginPage();
          }
        },
      ),
    );
  }
}
