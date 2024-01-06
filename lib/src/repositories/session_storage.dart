import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SessionStorage {

  //Save Session Key
  static void saveSessionKey(String sessionKey) async {
    final storage = FlutterSecureStorage();

    String? existingSesstionKey = await storage.read(key: 'sessionKey');
    if (existingSesstionKey != null) {
      await storage.write(key: 'sessionKey', value: sessionKey);
    } else {
      await storage.write(key: 'sessionKey', value: sessionKey);
    }
  }

  // Get session Key
  static Future<String?> getSessionKey() async {
    final storage = FlutterSecureStorage();
    return await storage.read(key: 'sessionKey');
  }
}
