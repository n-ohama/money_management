import 'package:flutter/material.dart';

class FilledTextField extends StatelessWidget {
  const FilledTextField({
    required this.controller,
    required this.labelText,
    required this.maxLength,
    this.isNumber,
  });
  final TextEditingController controller;
  final String labelText;
  final int maxLength;
  final bool? isNumber;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLength: maxLength,
      keyboardType: isNumber != null && isNumber! ? TextInputType.number : null,
      decoration: InputDecoration(
        filled: true,
        labelText: labelText,
        helperText: '*必須',
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Enter at least 1 characters';
        }

        if (isNumber != null && isNumber! && double.tryParse(value) == null) {
          return 'Enter number type';
        }
        return null;
      },
    );
  }
}
