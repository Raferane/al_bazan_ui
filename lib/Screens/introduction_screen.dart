import 'package:albazen_test/Utils/custom_bottom_sheet_content.dart';
import 'package:albazen_test/Widgets/build_page.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({super.key});

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  final PageController _pageController = PageController();

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
          child: const CustomBottomSheetContent(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
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
                width: width,
                height: height,
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
                width: width,
                height: height,
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
}
