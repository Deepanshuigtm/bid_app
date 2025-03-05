import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Check if Firebase is already initialized
  if (Firebase.apps.isEmpty) {
    await Firebase.initializeApp();
  }
  runApp(const BidApp());
}

class BidApp extends StatelessWidget {
  const BidApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BID.ai',
      theme: ThemeData(
        primaryColor: const Color(0xFF0057FF),
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: const Color(0xFF1A2B3C),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const LoginScreen(),
    );
  }
}