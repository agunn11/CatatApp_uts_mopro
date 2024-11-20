import 'package:flutter/material.dart';

class CompletedTasksPage extends StatefulWidget {
  final List<String> completedTasks;

  const CompletedTasksPage({super.key, required this.completedTasks});

  @override
  _CompletedTasksPageState createState() => _CompletedTasksPageState();
}

class _CompletedTasksPageState extends State<CompletedTasksPage> {
  late List<String>
      completedTasks; // Membuat daftar lokal untuk menyimpan tugas

  @override
  void initState() {
    super.initState();
    completedTasks = List.from(widget.completedTasks); // Salin daftar awal
  }

  void _deleteTask(int index) {
    setState(() {
      completedTasks.removeAt(index); // Hapus tugas dari daftar
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tugas Selesai',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.teal,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: completedTasks.isEmpty
          ? const Center(
              child: Text(
                'Belum ada tugas yang selesai.',
                style: TextStyle(fontSize: 16),
              ),
            )
          : ListView.builder(
              itemCount: completedTasks.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  elevation: 3,
                  child: ListTile(
                    leading: const Icon(Icons.check_circle, color: Colors.teal),
                    title: Text(
                      completedTasks[index],
                      style: const TextStyle(
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        // Konfirmasi sebelum menghapus
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Hapus Tugas'),
                              content: const Text(
                                  'Apakah Anda yakin ingin menghapus tugas ini?'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(); // Tutup dialog
                                  },
                                  child: const Text(
                                    'Batal',
                                    style: TextStyle(color: Colors.teal),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(); // Tutup dialog
                                    _deleteTask(index); // Hapus tugas
                                  },
                                  child: const Text(
                                    'Hapus',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ),
                );
              },
            ),
    );
  }
}
