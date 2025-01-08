import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({super.key});

  @override
  _IntroductionScreenState createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Static Background Image
          Image.asset(
            'assets/secondbackground.jpg', // Background image remains the same
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Container(
            color: Colors.black.withOpacity(0.5), // Semi-transparent overlay
          ),
          // PageView for content
          PageView(
            controller: _pageController,
            children: [
              buildPage(
                text:
                    "Welcome to Albzan! Explore our unique collection of products.",
                buttonText: "Next",
                onPressed: () {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
              ),
              buildPage(
                text:
                    "Discover more features and enjoy your shopping journey with Albzan.",
                buttonText: "Get Started",
                onPressed: () => showCustomBottomSheet(context),
              ),
            ],
          ),
          // Smooth Page Indicator
          Positioned(
            bottom: 80,
            left: 0,
            right: 0,
            child: Center(
              child: SmoothPageIndicator(
                controller: _pageController,
                count: 2,
                effect: const WormEffect(
                  dotColor: Colors.grey,
                  activeDotColor: Colors.amber, // Gold color for active dot
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPage({
    required String text,
    required String buttonText,
    required VoidCallback onPressed,
  }) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
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

  // Custom bottom sheet function
  void showCustomBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      builder: (context) => DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.4,
        minChildSize: 0.2,
        maxChildSize: 0.8,
        builder: (_, controller) => SingleChildScrollView(
          controller: controller,
          child: CustomBottomSheetContent(),
        ),
      ),
    );
  }
}

class CustomBottomSheetContent extends StatelessWidget {
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
                  backgroundColor: Colors.orange,
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
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  elevation: 5.0,
                ),
                child: Text(
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
