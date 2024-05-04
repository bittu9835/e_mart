import 'dart:async';
import 'package:e_mart/screens/login_screen.dart';
import 'package:e_mart/utils/image_url.dart';
import 'package:e_mart/utils/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart' as rive;

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => const LoginScreen()),
          (route) => false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            MyTheme.primaryLight,
            MyTheme.primaryLight,
            MyTheme.primary,
            MyTheme.primary,
          ], begin: Alignment.topRight, end: Alignment.bottomLeft),
        ),
        child: Column(
          children: [
            Expanded(
                child: Container(
                    padding: const EdgeInsets.only(top: 100),
                    child: Center(
                        child: Align(child: Image.asset(ImageUrl.logo))))),
            const SizedBox(
                height: 150,
                width: double.maxFinite,
                child: rive.RiveAnimation.asset(RiveUrl.loader))
          ],
        ),
      ),
    );
  }
}
