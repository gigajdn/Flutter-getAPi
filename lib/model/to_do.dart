import 'dart:convert';

// Fungsi untuk mengubah string JSON menjadi daftar objek ToDo
List<ToDo> toDoFromJson(String str) => List<ToDo>.from(json.decode(str).map((x) => ToDo.fromJson(x)));

// Fungsi untuk mengubah daftar objek ToDo menjadi string JSON
String toDoToJson(List<ToDo> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ToDo {
  int userId;
  int id;
  String title;
  bool completed;

  ToDo({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  // Factory method untuk membuat objek ToDo dari JSON
  factory ToDo.fromJson(Map<String, dynamic> json) => ToDo(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    completed: json["completed"],
  );

  // Metode untuk mengubah objek ToDo menjadi map JSON
  Map<String, dynamic> toJson() => {
    "userId": userId,
    "id": id,
    "title": title,
    "completed": completed,
  };
}
