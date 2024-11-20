import 'package:flutter/material.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({super.key});

  @override
  _AddTaskPageState createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final TextEditingController _taskController = TextEditingController();

  void _saveTask() {
    final task = _taskController.text;
    if (task.isNotEmpty) {
      Navigator.of(context)
          .pop(task); // Mengirimkan tugas baru ke halaman DashboardPage
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Tugas tidak boleh kosong')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tambah Tugas',
          style: TextStyle(color: Colors.teal),
        ),
        iconTheme: const IconThemeData(
            color: Colors.teal), // Warna back button diubah ke putih
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _taskController,
              decoration: const InputDecoration(
                labelText: 'Tugas',
                hintText: 'Masukkan tugas baru',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
              ),
              onPressed: _saveTask,
              child: const Text(
                'Simpan Tugas',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
