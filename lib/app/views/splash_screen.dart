import 'package:flutter/material.dart';
import 'package:ride_now/app/views/login/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _controller.forward();

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF08152D),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 50),

          Center(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.orange.withOpacity(0.3),
                        blurRadius: 80,
                        spreadRadius: 20,
                      ),
                    ],
                  ),
                  child: Image.asset(
                    'assets/icons/image.png',
                    width: 140,
                    height: 140,
                  ),
                ),
                const SizedBox(height: 20),

                const Text(
                  "RideNow",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                Text(
                  "PREMIUM MOBILITY SOLUTIONS",
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 14,
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),
          ),

          const Spacer(),

          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Column(
                children: [
                  Container(
                    width: 200,
                    height: 6,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade800,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        width: 200 * _controller.value, // 0 -> 200
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  Text(
                    "V 2.4.0",
                    style: TextStyle(color: Colors.grey.shade700, fontSize: 16),
                  ),
                ],
              );
            },
          ),

          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
