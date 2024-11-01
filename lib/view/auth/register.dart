import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import 'package:thread/routes/routes_names.dart';
import 'package:thread/widgets/auth_button.dart';
import 'package:thread/widgets/auth_header.dart';
import 'package:thread/widgets/auth_text_field.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  void submit() {
    if (_formKey.currentState!.validate()) {

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,  
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const AuthHeader(
                title: "Register",
                description: "Welcome To Threads World",
              ),
              AuthTextField(
                validator: ValidationBuilder().required().minLength(3).maxLength(20).build(),
                labelText: "Name",
                obscureText: false,
                controller: nameController,
              ),
              AuthTextField(
                validator: ValidationBuilder().required().email().build(),
                labelText: "Email",
                obscureText: false,
                controller: emailController,
              ),
              AuthTextField(
                validator: ValidationBuilder().regExp(
                  RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}\$'),
                  "A minimum of 8 characters with a combination of uppercase, lowercase letters, numbers, and special characters is required.",
                ).build(),
                labelText: "Password",
                obscureText: true,
                controller: passwordController,
              ),
              AuthTextField(
                validator: (value) {
                  if (value != passwordController.text) {
                    return "Password does not match confirm password";
                  }
                  return null; 
                },
                labelText: "Confirm Password",
                obscureText: true,
                controller: confirmPasswordController,
              ),
              AuthButton(
                label: "Register",
                onPressed: submit,
              ),
              Text.rich(
                TextSpan(
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                  children: [
                    TextSpan(
                      text: "Login",
                      style: const TextStyle(
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.toNamed(RoutesNames.login);
                        },
                    ),
                  ],
                  text: "Already have an account?\t",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
