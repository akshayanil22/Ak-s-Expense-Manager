import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.emailController,
    this.labelText,
    this.obscureText = false,
    this.keyboardType
  });

  final TextEditingController emailController;
  final String? labelText;
  final bool obscureText;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: emailController,
      decoration: InputDecoration(
          labelText: labelText,
          border: const OutlineInputBorder()
      ),
      keyboardType: keyboardType,
      obscureText: obscureText,
    );
  }
}
