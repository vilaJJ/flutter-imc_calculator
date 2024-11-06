import 'package:flutter/material.dart';

class CalculateTextFieldWidget extends StatelessWidget {
  const CalculateTextFieldWidget({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.prefixIcon,
    required this.labelText,
    this.onFieldSubmitted,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final IconData prefixIcon;
  final String labelText;
  final void Function()? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      keyboardType: const TextInputType.numberWithOptions(
        signed: true,
        decimal: true,
      ),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        labelText: labelText,
        prefixIcon: Icon(prefixIcon),
        suffixIcon: controller.text.isNotEmpty
            ? IconButton(
                onPressed: _clearText,
                icon: const Icon(Icons.close_rounded),
              )
            : null,
      ),
      onFieldSubmitted: (value) {
        if (onFieldSubmitted != null) {
          onFieldSubmitted!();
        }
      },
      validator: (value) {
        final numValue = double.tryParse(value ?? "");
        if (numValue == null || numValue <= 0) {
          return "Insira um valor número válido.";
        }
        return null;
      },
    );
  }

  void _clearText() {
    controller.clear();
  }
}
