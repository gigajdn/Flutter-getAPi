import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/to_do.dart';

class ApiService {
  // URL endpoint untuk mengambil data To-Do
  final String baseUrl = 'https://jsonplaceholder.typicode.com';

  Future<List<ToDo>> fetchToDos(int start, int limit) async {
    var url = Uri.parse('$baseUrl/todos?_start=$start&_limit=$limit');
    var response = await http.get(url, headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    });

    if (response.statusCode == 200) {
      return toDoFromJson(utf8.decode(response.bodyBytes));
    } else {
      throw Exception('Failed to load to-dos');
    }
  }
}
