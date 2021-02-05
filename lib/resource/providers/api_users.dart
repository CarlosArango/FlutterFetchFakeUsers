import 'dart:convert';
import 'dart:io';

import 'package:fetch_user_jsonplaceholder/models/user.dart';
import 'package:http/http.dart' as http;

class ApiUsersProvider {
  final http.Client _httpClient;
  final baseUrl = "https://jsonplaceholder.typicode.com";

  ApiUsersProvider({
    http.Client httpClient,
  }) : _httpClient = httpClient ?? http.Client();

  Future<List<User>> getUsers() async {
    final response = await _httpClient.get(
      "$baseUrl/users",
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
    );

    if (response.statusCode != 200) {
      throw Exception('Ha ocurrido un error intenta mas tarde');
    }

    final body = json.decode(response.body);
    return List<User>.from(body.map((user) => User.fromJson(user)));
  }
}
