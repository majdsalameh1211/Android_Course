import 'package:flutter/material.dart';
import 'book_list_screen.dart';
import '../widgets/custom_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void navigateToBooks(BuildContext context, String ageGroup) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => BookListScreen(ageGroup: ageGroup),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Choose your child’s age",
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Icon(Icons.picture_as_pdf, color: Colors.deepPurple),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Icon(Icons.description, color: Colors.deepPurple),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            AgeGroupBox(
              label: "Ages 0–4",
              imageAsset: "assets/images/age_0_4.png",
              onTap: () => navigateToBooks(context, "0-4"),
            ),
            const SizedBox(height: 16),
            AgeGroupBox(
              label: "Ages 4–8",
              imageAsset: "assets/images/age_4_8.png",
              onTap: () => navigateToBooks(context, "4-8"),
            ),
            const SizedBox(height: 16),
            AgeGroupBox(
              label: "Ages 8–12",
              imageAsset: "assets/images/age_8_12.png",
              onTap: () => navigateToBooks(context, "8-12"),
            ),
          ],
        ),
      ),
    );
  }
}

class AgeGroupBox extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final String imageAsset;

  const AgeGroupBox({
    super.key,
    required this.label,
    required this.onTap,
    required this.imageAsset,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 200,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
            image: AssetImage(imageAsset),
            fit: BoxFit.cover,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 6,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.black.withOpacity(0.25),
                ),
              ),
            ),
            Center(
              child: Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  shadows: [Shadow(color: Colors.black, blurRadius: 4)],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
