import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool darkTheme = false;
  bool notificationsEnabled = true;
  double fontSize = 16.0;

  // Ideally, these preferences should be stored persistently e.g., with SharedPreferences
  // and loaded in initState.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        children: [
          SwitchListTile(
            title: Text('Dark Theme'),
            value: darkTheme,
            onChanged: (bool value) {
              setState(() {
                darkTheme = value;
                // Here you would also change the theme of the app
              });
            },
          ),
          ListTile(
            title: Text('Font Size: ${fontSize.toInt()}'),
            subtitle: Slider(
              min: 10.0,
              max: 24.0,
              divisions: 14,
              value: fontSize,
              onChanged: (newSize) {
                setState(() {
                  fontSize = newSize;
                  // Additionally, save to preferences and update the app theme/font size
                });
              },
            ),
          ),
          SwitchListTile(
            title: Text('Enable Notifications'),
            value: notificationsEnabled,
            onChanged: (bool value) {
              setState(() {
                notificationsEnabled = value;
                // Enable/Disable notification settings of the app
              });
            },
          ),
          ListTile(
            title: Text('Backup Notes'),
            leading: Icon(Icons.backup),
            onTap: () {
              // Implement backup functionality
            },
          ),
          ListTile(
            title: Text('Restore Notes'),
            leading: Icon(Icons.restore),
            onTap: () {
              // Implement restore functionality
            },
          ),
          ListTile(
            title: Text('Export Notes'),
            leading: Icon(Icons.import_export),
            onTap: () {
              // Implement export functionality
            },
          ),
          ListTile(
            title: Text('Delete All Notes'),
            leading: Icon(Icons.delete_forever),
            onTap: () {
              // Implement delete all notes functionality
            },
          ),
        ],
      ),
    );
  }
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notes App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
      ),
      home: SettingsScreen(),
    );
  }
}
