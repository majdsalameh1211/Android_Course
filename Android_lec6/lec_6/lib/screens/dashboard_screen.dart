import 'package:flutter/material.dart';
import 'app_list_screen.dart';

class DashboardScreen extends StatefulWidget {
  final String origin;

  const DashboardScreen({super.key, this.origin = 'dashboard'});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int selectedIndex = -1;

  final List<Map<String, String>> services = [
    {'label': 'Cleaning', 'icon': 'images/cleaning.png'},
    {'label': 'Plumber', 'icon': 'images/plumber.png'},
    {'label': 'Electrician', 'icon': 'images/electrician.png'},
    {'label': 'Painter', 'icon': 'images/painter.png'},
    {'label': 'Carpenter', 'icon': 'images/carpenter.png'},
    {'label': 'Gardener', 'icon': 'images/gardener.png'},
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final textColor = theme.textTheme.bodyLarge?.color;
    final cardColor = isDark ? Colors.grey[850] : Colors.grey[100];
    final bgColor = theme.colorScheme.background;

    return Scaffold(
      backgroundColor: bgColor,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Which service\ndo you need?',
              style: theme.textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: GridView.builder(
                itemCount: services.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemBuilder: (context, index) {
                  final service = services[index];
                  final isSelected = selectedIndex == index;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: cardColor,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: isSelected ? Colors.blue : Colors.transparent,
                          width: 2,
                        ),
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            service['icon']!,
                            height: 50,
                          ),
                          const SizedBox(height: 12),
                          Text(
                            service['label']!,
                            style: TextStyle(fontSize: 16, color: textColor),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (selectedIndex >= 0) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => AppListScreen(origin: widget.origin),
              ),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Please select a service first.')),
            );
          }
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}
