import 'package:flutter/material.dart';

class SettingsNotificationsScreen extends StatelessWidget {
  const SettingsNotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = Theme.of(context).textTheme.bodyMedium?.color ?? Colors.white;

    final List<Map<String, dynamic>> items = [
      {'icon': Icons.notifications, 'title': 'Push Notifications'},
      {'icon': Icons.email, 'title': 'Email Alerts'},
      {'icon': Icons.sms, 'title': 'SMS Alerts'},
      {'icon': Icons.settings, 'title': 'System Settings'},
      {'icon': Icons.security, 'title': 'Security'},
    ];

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text('Notification Settings'),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        foregroundColor: Theme.of(context).appBarTheme.foregroundColor,
      ),
      body: ListView.separated(
        itemCount: items.length,
        separatorBuilder: (_, __) => Divider(color: isDark ? Colors.grey[700] : Colors.grey[300]),
        itemBuilder: (context, index) {
          final item = items[index];
          return ListTile(
            leading: Icon(item['icon'], color: Colors.blue),
            title: Text(item['title'], style: TextStyle(color: textColor)),
            trailing: Icon(Icons.chevron_right, color: textColor),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('${item['title']} tapped')),
              );
            },
          );
        },
      ),
    );
  }
}
