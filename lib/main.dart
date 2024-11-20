import 'package:flutter/material.dart';
import 'splashscreen.dart'; // Mengimpor hanya splashscreen karena splashscreen sudah mengimpor loginpage

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CatatApps',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:
          const SplashScreen(), // Menampilkan SplashScreen saat pertama kali dibuka
    );
  }
}
