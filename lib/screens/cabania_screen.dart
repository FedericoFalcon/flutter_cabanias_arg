import 'package:flutter/material.dart';

class CabaniaScreen extends StatelessWidget {
  final String image;
  final String name;
  final String city;
  final String price;
  final String description; // Descripción adicional de la cabaña

  const CabaniaScreen({
    super.key,
    required this.image,
    required this.name,
    required this.city,
    required this.price,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Imagen principal de la cabaña
            Image.network(image,
                width: double.infinity, height: 250, fit: BoxFit.cover),

            // Descripción
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                description,
                style: const TextStyle(fontSize: 16),
              ),
            ),

            // Datos de la cabaña
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(city,
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold)),
                  Text(price,
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold)),
                ],
              ),
            ),

            // Título de la galería
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                "Galería de Imágenes",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),

            // Galería de imágenes
            FutureBuilder<List<String>>(
              future:
                  fetchGalleryImages(), // Llamada a tu API para obtener las imágenes de la galería
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasError) {
                  return const Center(
                      child: Text('Error al cargar las imágenes'));
                }

                final images = snapshot.data ?? [];

                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: images.length,
                  itemBuilder: (context, index) {
                    return Image.network(images[index], fit: BoxFit.cover);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  // Simula la carga de imágenes de interiores (esto lo reemplazas con tu llamada real a la API)
  Future<List<String>> fetchGalleryImages() async {
    await Future.delayed(const Duration(seconds: 2)); // Simula un delay
    // Aquí iría tu lógica para hacer la llamada a la API de imágenes de interiores
    return [
      'https://images.unsplash.com/photo-1518107784960-eb57c673a7ba?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&q=80&w=400',
      'https://images.unsplash.com/photo-1542718610-a1d656d1884c?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&q=80&w=400',
      'https://images.unsplash.com/photo-1525113990976-399835c43838?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&q=80&w=400',
      // Aquí agregas más URLs de las imágenes de la galería
    ];
  }
}
