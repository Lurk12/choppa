import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final bool isPassword;
  final bool isValid;
  final IconData icon;
  final Function(String) onChanged;

  const CustomTextField
  ({super.key, 
    required this.controller,
    required this.labelText,
    this.isPassword = false,
    required this.isValid,
    required this.icon,
    required this.onChanged,
  
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: labelText,
        suffixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: isValid ? Colors.grey : Colors.red, // Show red if invalid
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: isValid ? Colors.grey : Colors.red,
            width: 2.0,
          ),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
      ),
    );
  }
}
