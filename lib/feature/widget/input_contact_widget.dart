// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputContactWidget extends StatelessWidget {
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final IconData prefixIcon;
  final String label;
  final String hintText;
  final ValueChanged<String>? onChanged;
  const InputContactWidget(
      {super.key,
      required this.keyboardType,
      this.inputFormatters,
      required this.prefixIcon,
      required this.label,
      required this.hintText,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
          prefixIcon: Icon(prefixIcon),
          label: Text(label),
          hintText: 'Insert your first name',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0))),
      onChanged: onChanged,
    );
  }
}
