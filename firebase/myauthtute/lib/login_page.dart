import 'package:flutter/material.dart';
import 'package:myauthtute/google_sign_in.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () => GoogleSignInProvider().googleLogin(context),
          child: Text('Sign in with google'),
        ),
      ),
    );
  }
}
