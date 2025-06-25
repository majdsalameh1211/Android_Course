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
          Padding(
            padding: const EdgeInsets.only(bottom: 80),
            child: StreamBuilder<DatabaseEvent>(
              stream: FirebaseDatabase.instance.ref('stories').onValue,
              builder: (context, snapshot) {
                if (!snapshot.hasData || snapshot.data!.snapshot.value == null) {
                  return const Center(child: CircularProgressIndicator());
                }
                final storiesData =
                    Map<String, dynamic>.from(snapshot.data!.snapshot.value as Map);

                // Filter stories for this age group
                final filteredStories = storiesData.values
                    .where((story) =>
                        story['ageGroup'] == widget.ageGroup)
                    .take(2) // Only 2 books per age group
                    .toList();

                // Decide format and url
                final format = showWordBooks ? "Word" : "PDF";
                return ListView(
                  padding: const EdgeInsets.only(top: 16),
                  children: filteredStories.map<Widget>((story) {
                    String url = showWordBooks ? story['docxUrl'] : story['pdfUrl'];
                    return BookTile(
                      title: story['title'],
                      format: format,
                      url: url,
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
                    // Add your upload functionality here if needed
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
