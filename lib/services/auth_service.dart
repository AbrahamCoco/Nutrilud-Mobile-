import 'dart:async';

class AuthService {
  Future<bool> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 2));
    // Aquí iría la lógica real de API
    return email.isNotEmpty && password.length >= 6;
  }
}