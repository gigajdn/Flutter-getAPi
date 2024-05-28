import 'package:flutter/material.dart';
import '../model/to_do.dart';
import '../services/todo_service.dart';
import 'mobil_list_page.dart'; // Pastikan impor halaman MobilListPage

class ToDoListPage extends StatefulWidget {
  const ToDoListPage({Key? key}) : super(key: key);

  @override
  _ToDoListPageState createState() => _ToDoListPageState();
}

class _ToDoListPageState extends State<ToDoListPage> {
  final ToDoService toDoService = ToDoService();

  Future<List<ToDo>> fetchToDo() {
    return toDoService.fetchToDos(0, 10);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My To-Do List - Fhira Triana Maulani', style: Theme.of(context).textTheme.headlineMedium),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // Tombol kembali
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => MobilListPage()),
              (Route<dynamic> route) => false,
            );
          },
        ),
      ),
      body: FutureBuilder<List<ToDo>>(
        future: fetchToDo(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No data available'));
          } else {
            return ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final toDo = snapshot.data![index];
                return Card(
                  elevation: 4,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: toDo.completed ? Colors.green : Colors.red,
                      child: Text('${toDo.id}'),
                    ),
                    title: Text(
                      toDo.title,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    subtitle: Text(
                      'Completed: ${toDo.completed ? 'Yes' : 'No'}',
                      style: TextStyle(
                        color: toDo.completed ? Colors.green : Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Tambahkan fungsionalitas untuk menambah to-do baru
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Tambah To-Do baru!')),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blueAccent,
      ),
    );
  }
}
