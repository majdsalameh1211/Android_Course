import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/book_tile.dart';

class BookListScreen extends StatefulWidget {
  final String ageGroup;

  const BookListScreen({super.key, required this.ageGroup});

  @override
  State<BookListScreen> createState() => _BookListScreenState();
}

class _BookListScreenState extends State<BookListScreen> {
  bool showWordBooks = true;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final Color buttonColor =
        isDark ? const Color(0xFF0D47A1) : const Color(0xFFB3E5FC);
    final Color textColor = isDark ? Colors.white : Colors.blue[900]!;

    return Scaffold(
      appBar: CustomAppBar(
        title: "Ages ${widget.ageGroup}",
        actions: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 4),
                child: Text(
                  showWordBooks ? 'Word' : 'PDF',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
              Switch(
                value: showWordBooks,
                activeColor: Colors.white,
                inactiveThumbColor: Colors.white,
                inactiveTrackColor: Colors.grey[400],
                onChanged: (value) {
                  setState(() {
                    showWordBooks = value;
                  });
                },
              ),
            ],
          ),
        ],
      ),
      body: Stack(
        children: [
          // Book list with bottom padding
          Padding(
            padding: const EdgeInsets.only(bottom: 80),
            child: ListView(
              padding: const EdgeInsets.only(top: 16),
              children: showWordBooks
                  ? const [
                      BookTile(title: "Word Book 1 - Colors", format: "Word"),
                      BookTile(title: "Word Book 2 - Animals", format: "Word"),
                      BookTile(title: "Word Book 3 - Numbers", format: "Word"),
                    ]
                  : const [
                      BookTile(title: "PDF Book 1 - Shapes", format: "PDF"),
                      BookTile(title: "PDF Book 2 - Letters", format: "PDF"),
                      BookTile(title: "PDF Book 3 - Time", format: "PDF"),
                    ],
            ),
          ),

          // Centered bottom upload button
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: SizedBox(
                width: 180,
                height: 48,
                child: ElevatedButton.icon(
                  onPressed: () {
                  },
                  icon: const Icon(Icons.upload_file),
                  label: const Text("Upload Book"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: buttonColor,
                    foregroundColor: textColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 3,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
