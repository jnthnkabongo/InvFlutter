import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'http://127.0.0.1:8000/api';

  Future<dynamic> login(String email, String password) async {
    final response = await http.post(Uri.parse('$baseUrl/login'),
    headers: <String, String>{'Context-Type' : 'application/json; charset=UTF-8'},
    body: jsonEncode(<String, String>{'email': email, 'password' : password}),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }else{
       throw Exception('Erreur de connexion: ${response.statusCode} - ${response.body}');
    }
  }
}