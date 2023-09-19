import 'package:flutter/material.dart';
import 'package:flutter_testing/validator.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(key: ValueKey("app_bar_key"), "Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _form,
          child: Column(
            children: [
              TextFormField(
                validator: (value) => Validator.validateEmail(value ?? ""),
                controller: userNameController,
                key: const ValueKey("email_id"),
                decoration:
                    const InputDecoration(hintText: "Enter your email address"),
              ),
              const SizedBox(height: 20),
              TextFormField(
                validator: (value) => Validator.validatePassword(value ?? ""),
                controller: passwordController,
                key: const ValueKey("password"),
                decoration: const InputDecoration(
                    hintText: "Enter your password address"),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_form.currentState!.validate()) {}
                },
                child: const Text("Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
