import 'package:flutter/material.dart';

class BadgesPage extends StatelessWidget {
  final String title;

  const BadgesPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // This displays a page with the title "Badges Page".
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: const Center(
        child: Text('Badges Page'),
      ),
    );
    // It doesn't have any interactivity or user input yet
  }
}
