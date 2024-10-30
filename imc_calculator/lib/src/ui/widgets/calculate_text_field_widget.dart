import 'package:flutter/material.dart';

class CalculateTextFieldWidget extends StatelessWidget {
  const CalculateTextFieldWidget({
    super.key,
    required this.controller,
    required this.prefixIcon,
    required this.labelText,
  });

  final TextEditingController controller;
  final IconData prefixIcon;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        labelText: labelText,
        prefixIcon: Icon(prefixIcon),
      ),
    );
  }
}
