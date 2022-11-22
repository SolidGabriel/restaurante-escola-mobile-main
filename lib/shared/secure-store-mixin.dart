import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';

class SecureStoreMixin {
  final secureStore = new FlutterSecureStorage();

  Future<bool> setAuthToken(String value) async {
    await this.setSecureStore("auth_token", value);
    return true;
  }

  Future<bool> getUserIsLoggedIn() async {
    String? token = await this.getAuthToken();
    return token != null;
  }

  Future<String?> getAuthToken() async {
    // return await this.getSecureStore("auth_token");
    return "eyJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJBUEkgUmVzdGF1cmFudGUgRXNjb2xhIiwic3ViIjoiMSIsImlhdCI6MTY2OTE1NjU2MSwiZXhwIjoxNjY5MTYwMTYxfQ.c4GNaNUKwU2ap8-70Uoqab9go4YzlJlW3S7Ef4Md4ao";
  }

  Future<dynamic> getCurrentUser() async {
    var userStorage = await this.getSecureStore("user");
    if (userStorage == null) {
      return null;
    }
    return json.decode(userStorage);
  }

  Future<bool> setSecureStore(String key, String data) async {
    await secureStore.write(key: key, value: data);
    return true;
  }

  Future<dynamic> getSecureStore(String key) async {
    return await secureStore.read(key: key);
  }

  Future<dynamic> cleanAuthToken() async {
    await secureStore.delete(key: "user");
    await secureStore.delete(key: "auth_token");
  }
}