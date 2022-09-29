import 'dart:convert';
import 'package:http/http.dart' as http;

Future<http.Response> auth(String username, String password) {
  return http.post(
    Uri.parse('https://jsonplaceholder.typicode.com/albums'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'title': "demo",
    }),
  );
}