import 'package:flutter/material.dart';

class ArchiveScreen extends StatefulWidget {

  const ArchiveScreen({super.key});

  @override
  State<ArchiveScreen> createState() => _ArchiveScreenState();
}

class _ArchiveScreenState extends State<ArchiveScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Archive Screen'),
      ),

      body: Text('Coming soon'),
    );
  }
}
