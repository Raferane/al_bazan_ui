import 'package:flutter/material.dart';

Widget buildPage({
  required String text,
  required String buttonText,
  required VoidCallback onPressed,
  required width,
  required height,
}) {
  return Container(
    height: height,
    width: width,
    padding: const EdgeInsets.all(16),
    child: Column(
      children: [
        const Spacer(
          flex: 3,
        ),
        Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(
          flex: 4,
        ),
        ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.amber, // Gold color
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            padding:
                const EdgeInsets.symmetric(vertical: 12.0, horizontal: 48.0),
          ),
          child: Text(
            buttonText,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ],
    ),
  );
}
