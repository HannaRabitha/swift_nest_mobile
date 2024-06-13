import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [Colors.teal, Colors.tealAccent]),
        // begin: Alignment.topRight,
        // end: Alignment.bottomLeft,
        image: DecorationImage(
          image: AssetImage("assets/images/splash.png"),
          fit: BoxFit.cover,
        ),
      ),
      // child: const Column(
      //   children: [
      //     Icon(
      //       Icons.home,
      //       size: 100,
      //       color: Colors.white,
      //     ),
      //     SizedBox(
      //       height: 10,
      //     ),
      //     Text(
      //       "Swift's Nest",
      //       style: TextStyle(
      //         fontSize: 10,
      //         color: Colors.white,
      //         fontWeight: FontWeight.bold,
      //       ),
      //     ),
      //   ],
      // ),
    ));
  }
}
