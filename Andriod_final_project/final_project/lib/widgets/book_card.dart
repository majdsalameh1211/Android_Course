import 'package:flutter/material.dart';
import '../screens/book_list_screen.dart';

class BookCard extends StatelessWidget {
  final String ageGroup;
  final String imageAsset;

  const BookCard({
    super.key,
    required this.ageGroup,
    required this.imageAsset,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => BookListScreen(ageGroup: ageGroup),
        ));
      },
      child: Card(
        elevation: 4,
        child: Column(
          children: [
            Expanded(child: Image.asset(imageAsset)),
            const SizedBox(height: 8),
            Text("Ages $ageGroup", style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
