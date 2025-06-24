import 'package:flutter/material.dart';

class BookTile extends StatefulWidget {
  final String title;
  final String format;

  const BookTile({
    super.key,
    required this.title,
    required this.format,
  });

  @override
  State<BookTile> createState() => _BookTileState();
}

class _BookTileState extends State<BookTile>
    with SingleTickerProviderStateMixin {
  bool isDownloaded = false;
  bool isLoading = false;
late final AnimationController _controller;


  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          isLoading = false;
          isDownloaded = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void handleDownload() {
    if (isDownloaded || isLoading) return;

    setState(() {
      isLoading = true;
    });
    _controller.forward(from: 0); // Start the animation
  }

  void handleOpen() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Opening ${widget.title} (${widget.format})..."),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final Color backgroundColor =
        isDark ? const Color(0xFF0D47A1) : Colors.blue[50]!;
    final Color textColor = isDark ? Colors.white : Colors.black87;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: isDark ? Colors.black26 : Colors.grey.shade300,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          // Book Icon
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: isDark ? Colors.blue[300] : Colors.blue[200],
              shape: BoxShape.circle,
            ),
            child: Icon(
              widget.format == "PDF"
                  ? Icons.picture_as_pdf
                  : Icons.description,
              size: 32,
              color: Colors.white,
            ),
          ),

          const SizedBox(width: 12),

          // Title + Button
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    height: 36,
                    child: ElevatedButton(
                      onPressed: isLoading
                          ? null
                          : isDownloaded
                              ? handleOpen
                              : handleDownload,
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            isDownloaded ? Colors.green : Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: isLoading
                          ? AnimatedBuilder(
                              animation: _controller,
                              builder: (context, child) {
                                return Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    SizedBox(
                                      width: 22,
                                      height: 22,
                                      child: CircularProgressIndicator(
                                        value: _controller.value,
                                        strokeWidth: 2,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const Icon(Icons.stop,
                                        size: 12, color: Colors.white),
                                  ],
                                );
                              },
                            )
                          : Text(
                              isDownloaded ? "OPEN" : "GET",
                              style: const TextStyle(color: Colors.white),
                            ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
