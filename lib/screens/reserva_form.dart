import 'package:flutter/material.dart';
import '../widgets/drawer_menu.dart';

class FormularioReservaScreen extends StatelessWidget {
  const FormularioReservaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'CabaniasArg',
          style: TextStyle(fontSize: 22, color: Colors.black87),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        elevation: 10,
      ),
      drawer: DrawerMenu(),
      body: const Center(
        child: Text('Aca iria el form'),
      ),
    );
  }
}
