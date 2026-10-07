import 'package:flutter/material.dart';
import 'package:ride_now/app/views/splash_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // 1. Light Theme Configurations (From PRD)
    final lightTheme = ThemeData(
      brightness: Brightness.light,
      // scaffoldBackgroundColor: const Color(0xFFFFFFFF), // Background
      colorScheme: const ColorScheme.light(
        primary: Color(0xFF111827), // Primary
        secondary: Color(0xFFF97316), // Secondary
        surface: Color(0xFFF8FAFC), // Surface
        error: Color(0xFFEF4444), // Error
      ),
    );

    // 2. Dark Theme Configurations (Mapped from PRD)
    final darkTheme = ThemeData(
      brightness: Brightness.dark,
      // scaffoldBackgroundColor: const Color(0xFF0F172A), // Mapped Dark Canvas
      colorScheme: const ColorScheme.dark(
        primary: Color(0xFFF8FAFC), // Inverted for readability
        secondary: Color(0xFFF97316), // Brand accent remains constant
        surface: Color(0xFF1E293B), // Mapped Dark Card Surface
        error: Color(0xFFEF4444), // Error remains semantic red
      ),
    );
    return MaterialApp(
      builder: (context, child) {
        return SafeArea(child: child ?? SizedBox.shrink());
      },
      theme: lightTheme,
      darkTheme: darkTheme,

      
      themeMode: ThemeMode.system,
      home: SplashScreen(),
    );
  }
}
