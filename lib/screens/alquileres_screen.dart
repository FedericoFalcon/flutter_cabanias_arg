import 'package:flutter/material.dart';
import '../widgets/drawer_menu.dart';

class AlquileresScreen extends StatelessWidget {
  const AlquileresScreen({super.key});

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
        body: ListView(physics: BouncingScrollPhysics(), children: [
          ListTile(
            title: Text('Titulo'),
            subtitle: Text('Subtitulo'),
            leading: Icon(Icons.access_alarm),
            trailing: Icon(Icons.arrow_forward),
          ),
          ListTile(
            title: Text('Titulo'),
            subtitle: Text('Subtitulo'),
            leading: Icon(Icons.access_alarm),
            trailing: Icon(Icons.arrow_forward),
          ),
        ]));
  }
}
