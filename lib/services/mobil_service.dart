import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/mobil.dart'; // Pastikan impor model Mobil sudah benar

class MobilService {
  static const String url = "http://10.0.2.2:3000/api/mobils";

  static Future<List<Mobil>> fetchMobils() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<Mobil> mobils = body.map((dynamic item) => Mobil.fromJson(item)).toList();
      return mobils;
    } else {
      throw Exception('Failed to load mobils');
    }
  }
}
