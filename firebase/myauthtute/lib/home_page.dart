import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:myauthtute/google_sign_in.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => GoogleSignInProvider().logout(),
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                user.photoURL!,
              ),
            ),
            Text(user.displayName!),
            Text('LOGGES IN AS: ${user.email}'),
            Text(user.emailVerified.toString()),
            Text(user.phoneNumber.toString()),
            Text(user.uid),
          ],
        ),
      ),
    );
  }
}
