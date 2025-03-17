import 'package:flutter/material.dart';
import 'package:mca/HomeScreen.dart';
import 'package:mca/otp_screen.dart';
import 'splash_screen.dart'; // Import Splash Screen

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: OTPScreen(phoneNumber: "+9558023237"),
    routes: {
      "/home": (context) => HomeScreen(), // Ensure HomeScreen() exists
    },
  ));
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(), // Start with Splash Screen
    );
  }
}
