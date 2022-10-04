import 'dart:convert';
import 'package:http/http.dart' as http;

Future<http.Response> auth(String username, String password) {
  return http.post(
    Uri.parse('https://127.0.0.1:443/launcher/account/login'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'email': username,
      'password': password
    }),
  );
}
// TODO: Implement register
Future<http.Response> register(String username, String password) {
  return http.post(
    Uri.parse('https://127.0.0.1:443/launcher/account/register'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'email': username,
      'password': password
    }),
  );
}