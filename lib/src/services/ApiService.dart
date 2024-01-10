import 'dart:convert';
import 'package:http/http.dart' as http;
import '../repositories/session_storage.dart';

class ApiService {
  static const String _baseUrl = 'http://172.16.11.7:5151';

  static Future<bool> sendLoginRequest(Map<String, dynamic> requestBody) async {
    try {
      var response = await http.post(
        Uri.parse('$_baseUrl/user-login'),
        body: jsonEncode(requestBody),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        if (response.body == 'IsUserNotValid') {
          return false;
        }
        String sessionKey = response.body;
        SessionStorage.saveSessionKey(sessionKey);
        return true;
      } else {
        return false; // User is not logged in due to an error
      }
    } catch (error) {
      return false; // User is not logged in due to an exception
    }
  }

  Future<List<Map<String, dynamic>>> getBooksByTitle(String title) async {
    final response = await http
        .get(Uri.parse('$_baseUrl/api/Books/get-books-details?title=$title'));
    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body);
      return responseData.cast<Map<String, dynamic>>();
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  Future<Map<String, dynamic>> getBookDetails(int bookId) async {
    print("Hello World");
    final response = await http
        .get(Uri.parse('$_baseUrl/api/Books/get-book-data?id=$bookId'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return data;
    } else {
      throw Exception('Failed to load book details');
    }
  }
}
