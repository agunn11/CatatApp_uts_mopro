import 'package:flutter/material.dart';
import 'profilepage.dart'; //import halaman profil
import 'loginpage.dart'; //import halaman login
import 'tambahtugaspage.dart'; //import halaman tambah tugas
import 'edittugaspage.dart'; //import halaman edit tugas
import 'tugasselesaipage.dart'; //import halaman tugas yang sudah selesai

class DashboardPage extends StatefulWidget {
  final String username;
  final String email;

  const DashboardPage({super.key, required this.username, required this.email});

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  List<String> tasks = []; // Daftar tugas aktif
  List<String> completedTasks = []; // Daftar tugas selesai

  void _addTask(String task) {
    setState(() {
      tasks.insert(0, task); // Menambahkan tugas baru di posisi pertama
    });
  }

  void _markTaskAsCompleted(int index) {
    setState(() {
      completedTasks.add(tasks[index]);
      tasks.removeAt(index);
    });
  }

  void _removeTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  void _editTask(int index, String newTask) {
    setState(() {
      tasks[index] = newTask;
    });
  }

  void _logout() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const LoginPage(),
      ),
    );
  }

  void _goToProfile() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ProfilePage(
          username: widget.username,
          email: widget.email, // Mengirimkan email ke ProfilePage
        ),
      ),
    );
  }

  void _goToCompletedTasks() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>
            CompletedTasksPage(completedTasks: completedTasks),
      ),
    );
  }

  void _showAboutApp() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Tentang Aplikasi'),
          content: const Text(
              'Ini adalah aplikasi CatatApp untuk mengelola tugas sehari-hari.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Menutup dialog
              },
              child: const Text(
                'Tutup',
                style: TextStyle(color: Colors.teal),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'CatatApp',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.teal,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: const Icon(Icons.checklist),
            onPressed:
                _goToCompletedTasks, // Navigasi ke halaman CompletedTasksPage
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.teal,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              accountName: Text(
                widget.username,
                style: const TextStyle(color: Colors.teal),
              ),
              accountEmail: Text(
                widget.email, // Menampilkan email
                style: const TextStyle(color: Colors.teal),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.teal,
                child: Text(
                  widget.username[0].toUpperCase(),
                  style: const TextStyle(fontSize: 40, color: Colors.white),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person, color: Colors.white),
              title:
                  const Text('Profile', style: TextStyle(color: Colors.white)),
              onTap: _goToProfile,
            ),
            ListTile(
              leading: const Icon(Icons.exit_to_app, color: Colors.white),
              title:
                  const Text('Logout', style: TextStyle(color: Colors.white)),
              onTap: _logout,
            ),
            ListTile(
              leading: const Icon(Icons.info, color: Colors.white),
              title: const Text('Tentang Aplikasi',
                  style: TextStyle(color: Colors.white)),
              onTap: _showAboutApp,
            ),
          ],
        ),
      ),
      body: tasks.isEmpty
          ? const Center(child: Text('Belum ada tugas'))
          : ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  elevation: 5,
                  child: ListTile(
                    title: Text(tasks[index]),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.check_circle,
                              color: Colors.teal),
                          onPressed: () => _markTaskAsCompleted(index),
                        ),
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () async {
                            final updatedTask =
                                await Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    EditTaskPage(task: tasks[index]),
                              ),
                            );
                            if (updatedTask != null) {
                              _editTask(index, updatedTask);
                            }
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () => _removeTask(index),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const AddTaskPage(),
            ),
          );
          if (result != null) {
            _addTask(result);
          }
        },
        child: const Icon(Icons.add, color: Colors.white),
        backgroundColor: Colors.teal,
      ),
    );
  }
}
