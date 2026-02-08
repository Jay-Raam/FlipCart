import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import '../ui/space.dart';
import '../ui/text_styles.dart';
import '../ui/box.dart';
import '../ui/input.dart';
import '../ui/button.dart';
import 'dashboard.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final userCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  String? error;

  Future<void> login() async {
    final ok = await AuthService.login(
      userCtrl.text.trim(),
      passCtrl.text.trim(),
    );

    if (ok) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const DashboardScreen()),
      );
    } else {
      setState(() => error = 'Invalid username or password');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),
      body: Center(
        child: Container(
          width: 380,
          padding: const EdgeInsets.all(24),
          decoration: Box.card,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Login', style: AppText.title),
              Space.h24,

              TextField(decoration: appInput('Username'), controller: userCtrl),
              Space.h16,

              TextField(
                decoration: appInput('Password'),
                controller: passCtrl,
                obscureText: true,
              ),

              if (error != null) ...[
                Space.h16,
                Text(error!, style: AppText.error),
              ],

              Space.h24,
              ElevatedButton(
                style: AppButton.primary,
                onPressed: login,
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
