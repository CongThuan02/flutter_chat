import 'package:flutter/material.dart';

class MyBytton extends StatelessWidget {
  final double width;
  final double height;
  final double borderRadius;
  final String textButton;
  final void Function()? onPressed;
  const MyBytton(
      {super.key,
      required this.height,
      required this.width,
      required this.borderRadius,
      required this.textButton,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(width, height),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      onPressed: onPressed,
      child: Text(textButton),
    );
  }
}
