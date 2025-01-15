import 'package:flutter/material.dart';

class CustomBottomSheetContent extends StatelessWidget {
  const CustomBottomSheetContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // App Logo
          Image.asset('assets/albazanlogo.jpg', height: 100.0),

          const SizedBox(height: 20.0),

          // Welcome Text
          const Text(
            "Welcome to the Gift Store",
            style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
              decoration: TextDecoration.none, // Removes underline
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8.0),
          const Text(
            "Find amazing gifts and exclusive offers tailored just for you.",
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.black54,
              height: 1.5,
              decoration: TextDecoration.none, // Removes underline
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24.0),

          // Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Navigate to the main app
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 202, 151, 0),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24.0, vertical: 12.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  elevation: 5.0,
                ),
                child: const Text(
                  "Let's Go",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Navigate as a guest
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey.shade400,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24.0, vertical: 12.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  elevation: 5.0,
                ),
                child: const Text(
                  "Let's Go as Guest",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
