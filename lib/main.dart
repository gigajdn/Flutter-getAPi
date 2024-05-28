import 'package:flutter/material.dart';
import 'pages/mobil_list_page.dart';
import 'pages/todo_list_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.grey[100],
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blueAccent,
          elevation: 0,
        ),
        textTheme: TextTheme(
          headlineMedium: TextStyle(  // Menggunakan headline4
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.blueAccent,
          ),
          bodyLarge: TextStyle( // Menggunakan bodyText1
            fontSize: 16,
            color: Colors.black,
          ),
        ),
      ),
      home: MobilListPage(),
      routes: {
        '/todos': (context) => ToDoListPage(),
      },
    );
  }
}
