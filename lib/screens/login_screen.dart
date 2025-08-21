import 'package:Nutrilud/theme/app_colors.dart';
import 'package:Nutrilud/widgets/login/login_form.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: size.height - MediaQuery.of(context).padding.top,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.primary.withOpacity(0.3),
                              blurRadius: 10,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: const Icon(Icons.lock_outline,
                            color: AppColors.onPrimary, size: 50),
                      ),
                      const SizedBox(height: 24),
                      Text('Bienvenido a NutriLud',
                          style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryDark)),
                      const SizedBox(height: 8),
                      Text('Inicia sesión en tu cuenta',
                          style: TextStyle(fontSize: 16, color: Colors.grey[700])),
                    ],
                  ),
                ),
                const Expanded(flex: 3, child: LoginForm()),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      const Spacer(),
                      TextButton(
                        onPressed: () {},
                        child: RichText(
                          text: TextSpan(
                            text: '¿No tienes una cuenta? ',
                            style: TextStyle(color: Colors.grey[600]),
                            children: [
                              TextSpan(
                                text: 'Regístrate',
                                style: TextStyle(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
