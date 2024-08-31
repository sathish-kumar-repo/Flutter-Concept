// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInProvider {
  final googleSignIn = GoogleSignIn();

  GoogleSignInAccount? _user;

  GoogleSignInAccount get user => _user!;

  Future<void> googleLogin(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser == null) return;
      _user = googleUser;

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      showDialog(
        context: context,
        builder: (context) => const Center(
          child: CircularProgressIndicator.adaptive(),
        ),
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
      Navigator.of(context).pop();
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  logout() async {
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
  }
}
