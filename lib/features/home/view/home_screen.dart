import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final String title;
  const HomeScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(this.title)),
      body: const Center(child: Text('Welcome to the Home Screen!')),
    );
  }
}
