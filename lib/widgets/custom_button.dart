import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({Key? key, required this.textButton, this.onTap})
      : super(key: key);
  String textButton;
  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(16),
        ),
        width: double.infinity,
        height: 60,
        child: Center(
          child: Text(
            textButton,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
