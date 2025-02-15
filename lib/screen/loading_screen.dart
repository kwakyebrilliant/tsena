import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Third Positioned widget for card (displaying details of single item)
    return Positioned(
      left: 0.0,
      right: 0.0,
      top: 260.0,

      // Padding around container for displaying single item details
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),

        // Container for displaying single item details
        child: Container(
          height: MediaQuery.of(context).size.height / 2 + 100.0,
          padding: const EdgeInsets.all(20.0),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: const Color(0xFFFFFFFF),
            borderRadius: BorderRadius.circular(5.0),
            border: Border.all(
              color: const Color(0xFFD3D3D3),
              width: 0.4,
            ),
          ),
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(12.0),
              height: 50.0,
              width: 50.0,
              decoration: const BoxDecoration(
                color: Color(0xFFFFFFFF),
                shape: BoxShape.circle,
              ),
              child: const CircularProgressIndicator(
                color: Color(0xFF000000),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
