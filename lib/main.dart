import 'package:flutter/material.dart';
import 'screens/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo',
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
      initialRoute: 'listview1',
      routes: {
        'home': (context) => const HomeScreen(),
      },
    );
  }
}
