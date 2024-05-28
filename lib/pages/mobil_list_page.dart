import 'package:flutter/material.dart';
import '../model/mobil.dart';
import '../services/mobil_service.dart';
import 'todo_list_page.dart';

class MobilListPage extends StatefulWidget {
  @override
  _MobilListPageState createState() => _MobilListPageState();
}

class _MobilListPageState extends State<MobilListPage> {
  late Future<List<Mobil>> futureMobils;

  @override
  void initState() {
    super.initState();
    futureMobils = MobilService.fetchMobils();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mobil List Page - Fhira Triana Maulani'),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            ListTile(
              title: const Text('Mobil List'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => MobilListPage()),
                );
              },
            ),
            ListTile(
              title: const Text('To Do'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/todos');
              },
            ),
          ],
        ),
      ),
      body: FutureBuilder<List<Mobil>>(
        future: futureMobils,
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
                final mobil = snapshot.data![index];
                return Card(
                  elevation: 4,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Text('${mobil.id}'),
                    ),
                    title: Text(
                      mobil.brand,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    subtitle: Text(
                      '${mobil.model} - ${mobil.color}',
                      style: TextStyle(
                        color: Colors.grey,
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
    );
  }
}
