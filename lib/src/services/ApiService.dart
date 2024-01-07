import 'dart:convert';
import 'package:http/http.dart' as http;
import '../repositories/session_storage.dart';

class ApiService {
  static const String _baseUrl = 'http://192.168.8.101:5151';

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
}
