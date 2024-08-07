// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:scholar_chat/constats.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({super.key, required this.hintText, this.onChanged});
  final String hintText;
  Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return 'This field is required';
          }
          return null;
        },
        onChanged: onChanged,
        style: const TextStyle(color: kWhiteColor),
        decoration: InputDecoration(
          hintStyle: TextStyle(
            color: Colors.white.withOpacity(0.3),
          ),
          hintText: hintText,
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
