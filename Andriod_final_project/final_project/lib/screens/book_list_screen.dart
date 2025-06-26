import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/book_tile.dart';

class BookListScreen extends StatefulWidget {
  final String ageGroup;

  const BookListScreen({super.key, required this.ageGroup});

  @override
  State<BookListScreen> createState() => _BookListScreenState();
}

class _BookListScreenState extends State<BookListScreen> {
  bool showWordBooks = true; // Toggle between Word and PDF

  Future<List<Map<String, dynamic>>> fetchStories() async {
    final ref = FirebaseDatabase.instance.ref('stories');
    final snapshot = await ref.get();
    List<Map<String, dynamic>> result = [];
    if (snapshot.exists) {
      final data = Map<String, dynamic>.from(snapshot.value as Map);
      data.forEach((key, value) {
        final story = Map<String, dynamic>.from(value);
        if (story['ageGroup'] == widget.ageGroup) {
          result.add(story);
        }
      });
    }
    return result;
  }

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
          // Main book list content with bottom padding for button
          Padding(
            padding: const EdgeInsets.only(bottom: 80),
            child: FutureBuilder<List<Map<String, dynamic>>>(
              future: fetchStories(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }
                final stories = snapshot.data ?? [];
                if (stories.isEmpty) {
                  return const Center(child: Text('No books found.'));
                }
                return ListView(
                  padding: const EdgeInsets.only(top: 16),
                  children: stories.map((story) {
                    final url = showWordBooks ? story['docxUrl'] : story['pdfUrl'];
                    final format = showWordBooks ? "Word" : "PDF";
                    return BookTile(
                      title: story['title'] ?? '',
                      format: format,
                      url: url ?? '',
                    );
                  }).toList(),
                );
              },
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
                    // Add your upload functionality here
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
