import 'package:flutter/material.dart';
import '../widgets/drawer_menu.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
      ),
      drawer: DrawerMenu(),
      body: const Center(child: Text('Widget')),
    );
  }
}