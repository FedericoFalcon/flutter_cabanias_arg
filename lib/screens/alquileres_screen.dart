import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // Para convertir la respuesta JSON en objetos Dart
import '../widgets/drawer_menu.dart';

class AlquileresScreen extends StatefulWidget {
  const AlquileresScreen({super.key});

  @override
  _AlquileresScreenState createState() => _AlquileresScreenState();
}

class _AlquileresScreenState extends State<AlquileresScreen> {
  List<Alquiler> alquileres = [];

  @override
  void initState() {
    super.initState();
    fetchAlquileres();
  }

  // Llamada a la API
  Future<void> fetchAlquileres() async {
    final response = await http.get(
        Uri.parse('https://demo-express-2024.onrender.com/api/v1/alquileres'));

    if (response.statusCode == 200) {
      final List<dynamic> alquileresJson =
          json.decode(response.body)['alquileres'];
      setState(() {
        alquileres = alquileresJson
            .map((alquiler) => Alquiler.fromJson(alquiler))
            .toList();
      });
    } else {
      throw Exception('Failed to load alquileres');
    }
  }

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
      body: alquileres.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: alquileres.length,
              itemBuilder: (context, index) {
                final alquiler = alquileres[index];
                return ListTile(
                  contentPadding: const EdgeInsets.all(8),
                  leading: Image.network(alquiler.image,
                      width: 50, height: 50, fit: BoxFit.cover),
                  title: Text(alquiler.name),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(alquiler.city, style: const TextStyle(fontSize: 12)),
                      Text(alquiler.price,
                          style: const TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  trailing: const Icon(Icons.arrow_forward),
                  onTap: () {
                    // dejo listo
                  },
                );
              },
            ),
    );
  }
}

class Alquiler {
  final String image;
  final String name;
  final String city;
  final String price;

  Alquiler(
      {required this.image,
      required this.name,
      required this.city,
      required this.price});

  factory Alquiler.fromJson(Map<String, dynamic> json) {
    return Alquiler(
      image: json['image'],
      name: json['name'],
      city: json['city'],
      price: json['price'],
    );
  }
}
