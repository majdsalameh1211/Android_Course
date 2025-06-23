import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget _buildInfoTile(BuildContext context, String label, String value, {bool isLink = false}) {
    final textColor = Theme.of(context).textTheme.bodyMedium?.color ?? Colors.black;

    return ListTile(
      title: Text(label, style: TextStyle(fontWeight: FontWeight.bold, color: textColor)),
      subtitle: isLink
          ? GestureDetector(
              onTap: () => _launchURL(value),
              child: Text(
                value,
                style: const TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            )
          : Text(value, style: TextStyle(color: textColor)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 12),
              const CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('images/profile.jpg'),
              ),
              const SizedBox(height: 20),
              _buildInfoTile(context, 'Name', 'Majd Salameh'),
              _buildInfoTile(context, 'Email', 'majdsalameh9@gmail.com'),
              _buildInfoTile(context, 'Phone', '+972-508559373'),
              _buildInfoTile(context, 'Education', 'B.Sc. Software Engineering, ORT Braude College'),
              _buildInfoTile(context, 'LinkedIn', 'https://linkedin.com/in/majd-salameh', isLink: true),
              _buildInfoTile(context, 'GitHub', 'https://github.com/majd-salameh', isLink: true),
              _buildInfoTile(context, 'Portfolio', 'https://portfolio-iota-sable-12.vercel.app', isLink: true),
            ],
          ),
        ),
      ),
    );
  }
}
