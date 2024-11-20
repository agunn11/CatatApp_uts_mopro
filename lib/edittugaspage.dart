import 'package:flutter/material.dart';

class EditTaskPage extends StatefulWidget {
  final String task;

  const EditTaskPage({super.key, required this.task});

  @override
  _EditTaskPageState createState() => _EditTaskPageState();
}

class _EditTaskPageState extends State<EditTaskPage> {
  late TextEditingController _taskController;

  @override
  void initState() {
    super.initState();
    _taskController = TextEditingController(text: widget.task);
  }

  void _saveTask() {
    final task = _taskController.text;
    if (task.isNotEmpty) {
      Navigator.of(context).pop(task); // Mengirim tugas yang sudah diedit
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
          'Edit Tugas',
          style: TextStyle(color: Colors.teal),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,
              color: Colors.teal), // Tombol kembali dengan warna putih
          onPressed: () {
            Navigator.pop(context); // Kembali ke halaman sebelumnya
          },
        ),
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
                hintText: 'Edit tugas',
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
