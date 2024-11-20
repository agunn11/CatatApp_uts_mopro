import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String username;
  final String email; // Menambahkan variabel email

  // Menambahkan email ke konstruktor
  const ProfilePage({super.key, required this.username, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.teal,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,
              color: Colors.white), // Ganti warna ikon "Kembali"
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Username: $username',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Informasi Profil Lainnya:',
              style: TextStyle(fontSize: 18),
            ),
            // Tambahkan informasi profil lainnya sesuai kebutuhan.
          ],
        ),
      ),
    );
  }
}
