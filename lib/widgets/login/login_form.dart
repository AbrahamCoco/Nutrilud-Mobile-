import 'package:Nutrilud/services/auth_service.dart';
import 'package:Nutrilud/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'login_button.dart';
import 'social_buttons.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _authService = AuthService();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  String _email = '';
  String _password = '';
  bool _isLoading = false;
  bool _obscurePassword = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      setState(() => _isLoading = true);

      final success = await _authService.login(_email, _password);

      setState(() => _isLoading = false);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            success
                ? 'Iniciando sesión como $_email'
                : 'Error en las credenciales',
          ),
          backgroundColor: success ? AppColors.primary : AppColors.error,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          // Usuario
          TextFormField(
            focusNode: _emailFocusNode,
            decoration: InputDecoration(
              labelText: 'Usuario',
              prefixIcon: Icon(
                Icons.perm_identity_outlined,
                color: _emailFocusNode.hasFocus
                    ? AppColors.primary
                    : Colors.grey[600],
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            keyboardType: TextInputType.emailAddress,
            onFieldSubmitted: (_) =>
                FocusScope.of(context).requestFocus(_passwordFocusNode),
            validator: (value) => value != null && value.isNotEmpty
                ? null
                : 'El usuario no puede estar vacío',
            onSaved: (value) => _email = value!,
          ),
          const SizedBox(height: 20),

          // Contraseña
          TextFormField(
            focusNode: _passwordFocusNode,
            obscureText: _obscurePassword,
            decoration: InputDecoration(
              labelText: 'Contraseña',
              prefixIcon: Icon(
                Icons.lock_outline,
                color: _passwordFocusNode.hasFocus
                    ? AppColors.primary
                    : Colors.grey[600],
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscurePassword
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                ),
                onPressed: _togglePasswordVisibility,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            validator: (value) => value != null && value.length >= 6
                ? null
                : 'Mínimo 6 caracteres',
            onSaved: (value) => _password = value!,
          ),
          const SizedBox(height: 16),

          // Botón
          LoginButton(isLoading: _isLoading, onPressed: _login),
          const SizedBox(height: 24),

          // Divider
          Row(
            children: [
              Expanded(child: Divider()),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text('O'),
              ),
              Expanded(child: Divider()),
            ],
          ),
          const SizedBox(height: 24),

          // Redes sociales
          const SocialButtons(),
        ],
      ),
    );
  }
}
