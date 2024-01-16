// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class MyTextFormfield extends StatelessWidget {
  TextEditingController controller;
  bool hinPassword;
  String hinText;
  MyTextFormfield({
    super.key,
    required this.controller,
    required this.hinText,
    required this.hinPassword,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        obscureText: hinPassword,
        controller: controller,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          border: OutlineInputBorder(
            borderSide: BorderSide(
                width: 2, color: Theme.of(context).colorScheme.tertiary),
            borderRadius: BorderRadius.circular(12),
          ),
          hintText: hinText,
        ),
      ),
    );
  }
}
