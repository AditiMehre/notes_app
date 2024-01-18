import 'package:flutter/material.dart';
import 'package:notes_app/screens/deleted_screen.dart';
import 'package:notes_app/screens/help_feedback.dart';
import 'package:notes_app/screens/setting_screen.dart';
import 'package:notes_app/screens/share_app.dart';

import '../screens/archive_screen.dart';

class MainDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var style2 = TextStyle(color: Colors.white,);
    return Drawer(
      backgroundColor: Colors.grey.shade900,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            height: 110,
            padding: EdgeInsets.only(left: 16.0, bottom: 8.0),
            alignment: Alignment.centerLeft,
            color: Colors.grey.shade900,
            child:  const Padding(
              padding: EdgeInsets.only(top: 18),
              child: Text(
                'Notes',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.w700
                ),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.sticky_note_2_sharp,color: Colors.white,),
            title: Text('Notes', style: style2,),
            onTap: () {
              Navigator.pop(context); // Close the drawer
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('All notes are here!'),
                  duration: Duration(seconds: 2), // Adjust the duration as needed
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.archive,color: Colors.white),
            title:  Text('Archive', style: style2),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ArchiveScreen()),
              ); // Close the drawer
            },
          ),
          ListTile(
            leading: Icon(Icons.delete,color: Colors.white),
            title:  Text('Deleted', style: style2),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DeletedScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.settings,color: Colors.white),
            title: Text('Settings', style: style2),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.share,color: Colors.white),
            title: Text('Share App', style: style2),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ShareAppScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.help,color: Colors.white),
            title: Text('Help & Feedback', style: style2),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HelpFeedbackScreen()),
              );
            },
          ),

        ],
      ),
    );
  }
}
