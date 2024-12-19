import 'package:flutter/material.dart';
import 'home_screen.dart';

class FormScreen extends StatelessWidget {
  final String cabaniaName;
  final String imageUrl;

  const FormScreen({
    Key? key,
    required this.cabaniaName,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    TextEditingController _nameController = TextEditingController();
    TextEditingController _emailController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Formulario de Alquiler"),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Completa tus datos para alquilar la cabaña',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Text("Cabaña: $cabaniaName", style: TextStyle(fontSize: 16)),
              const SizedBox(height: 10),
              Image.network(imageUrl,
                  height: 200, width: double.infinity, fit: BoxFit.cover),
              const SizedBox(height: 20),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(labelText: 'Nombre'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor ingresa tu nombre';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                          labelText: 'Correo Electrónico'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor ingresa tu correo';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState?.validate() ?? false) {
                          showDialog(
                            context: context,
                            builder: (context) => Dialog(
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: const [
                                    CircularProgressIndicator(),
                                    SizedBox(height: 20),
                                    Text("Procesando..."),
                                  ],
                                ),
                              ),
                            ),
                          );

                          // Espera 2 seg
                          await Future.delayed(const Duration(seconds: 2));

                          Navigator.of(context).pop();

                          // Redirijo al Home
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()),
                          );

                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Formulario enviado')),
                          );
                        }
                      },
                      child: const Text('Alquilar'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
