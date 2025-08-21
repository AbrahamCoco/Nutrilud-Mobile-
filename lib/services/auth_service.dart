import 'dart:async';

import 'package:Nutrilud/services/api_service.dart';

class AuthService {
  Future<String?> login(String usuario, String contrasenia) async {
    try {
      final response = await ApiService().login(usuario, contrasenia);
      final data = response.data;
      if (data != null && data['success'] == true) {
        final dynamic token = data['data'];

        // final prefs = await SharedPreferences.getInstance();
        // await prefs.setString('token', token);

        return token;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}