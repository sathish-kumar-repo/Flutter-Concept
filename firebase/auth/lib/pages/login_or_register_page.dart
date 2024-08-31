import 'package:auth/pages/login_page.dart';
import 'package:auth/pages/register_page.dart';
import 'package:flutter/material.dart';

class LoginOrRegisterPage extends StatefulWidget {
  const LoginOrRegisterPage({super.key});

  @override
  State<LoginOrRegisterPage> createState() => _LoginOrRegisterPageState();
}

class _LoginOrRegisterPageState extends State<LoginOrRegisterPage> {
  bool _showLoginPage = true;
  void _togglePage() {
    setState(() {
      _showLoginPage = !_showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_showLoginPage) {
      return LoginPage(onTap: _togglePage);
    } else {
      return RegisterPage(onTap: _togglePage);
    }
  }
}
