import 'package:flutter/material.dart';
import 'dashboard_screen.dart';
import 'bottom_nav_screen.dart';

class AppListScreen extends StatefulWidget {
  final String origin;

  const AppListScreen({super.key, required this.origin});

  @override
  State<AppListScreen> createState() => _AppListScreenState();
}

class _AppListScreenState extends State<AppListScreen> {
  final List<AppItem> apps = List.generate(
    10,
    (index) => AppItem(
      name: 'App ${index + 1}',
      description: 'Lorem ipsum dolor sit amet',
      imagePath: 'images/app_icon.png',
    ),
  );

  void _simulateDownload(int index) async {
    setState(() {
      apps[index].isDownloading = true;
    });

    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      apps[index].isDownloading = false;
      apps[index].isDownloaded = true;
    });
  }

  void _handleBack(BuildContext context) {
    switch (widget.origin) {
      case 'dashboard':
        Navigator.pushReplacementNamed(context, '/dashboard');
        break;
      case 'home':
        Navigator.pushReplacementNamed(context, '/bottom');
        break;
      case 'menu':
      default:
        Navigator.popUntil(context, (route) => route.isFirst);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Apps'),
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => _handleBack(context),
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 12),
        itemCount: apps.length,
        separatorBuilder: (_, __) => const Divider(height: 1),
        itemBuilder: (context, index) {
          final app = apps[index];

          return ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                width: 60,
                height: 60,
                color: Colors.blue[100],
                child: Image.asset(
                  app.imagePath,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => const Icon(Icons.apps, size: 30),
                ),
              ),
            ),
            title: Text(
              app.name,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              app.description,
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
            trailing: _buildActionButton(app, index),
          );
        },
      ),
    );
  }

  Widget _buildActionButton(AppItem app, int index) {
    if (app.isDownloading) {
      return TweenAnimationBuilder<double>(
        tween: Tween(begin: 0, end: 1),
        duration: const Duration(seconds: 2),
        onEnd: () {
          setState(() {
            app.isDownloading = false;
            app.isDownloaded = true;
          });
        },
        builder: (context, value, child) {
          return Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 36,
                height: 36,
                child: CircularProgressIndicator(
                  value: value,
                  strokeWidth: 3,
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
                  backgroundColor: Colors.grey[200],
                ),
              ),
              const Icon(Icons.stop, size: 16, color: Colors.blue),
            ],
          );
        },
      );
    } else if (app.isDownloaded) {
      return ElevatedButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Opening ${app.name}...')),
          );
        },
        style: _buttonStyle(),
        child: const Text('OPEN'),
      );
    } else {
      return ElevatedButton(
        onPressed: () {
          setState(() {
            app.isDownloading = true;
          });
        },
        style: _buttonStyle(),
        child: const Text('GET'),
      );
    }
  }

  ButtonStyle _buttonStyle() {
    return ElevatedButton.styleFrom(
      backgroundColor: Colors.blue[100],
      foregroundColor: Colors.blue[800],
      shape: const StadiumBorder(),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      elevation: 0,
      textStyle: const TextStyle(fontWeight: FontWeight.bold),
    );
  }
}

class AppItem {
  final String name;
  final String description;
  final String imagePath;
  bool isDownloaded = false;
  bool isDownloading = false;

  AppItem({
    required this.name,
    required this.description,
    required this.imagePath,
  });
}
