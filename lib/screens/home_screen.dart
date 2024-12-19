import 'package:flutter/material.dart';
import '../widgets/drawer_menu.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'reserva_form.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

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
        backgroundColor: Colors.grey,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              CardPoster(size: size),
              const CardBody(),
              const SizedBox(
                height: 10,
              ),
              CardSwiper(),
            ],
          ),
        ));
  }
}

class CardBody extends StatelessWidget {
  const CardBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '¡Bienvenido!',
              style: TextStyle(fontFamily: 'Roboto', fontSize: 28),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              maxLines: 5,
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 16),
              'CabaniasArg es la mejor app para encontrar cabañas en Argentina! Desde el norte al sur de la Argentina, en CabaniasArg vas a encontrar las mejores opciones de alquiler y al mejor precio',
            )
          ],
        ));
  }
}

class CardSwiper extends StatefulWidget {
  const CardSwiper({Key? key}) : super(key: key);

  @override
  _CardSwiperState createState() => _CardSwiperState();
}

class _CardSwiperState extends State<CardSwiper> {
  List _novedades = [];

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    final response = await http.get(
        Uri.parse('https://demo-express-2024.onrender.com/api/v1/novedades'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        _novedades = data['novedades'];
      });
    } else {
      throw Exception('Error al cargar los datos');
    }
  }

  void _showReservationDialog(BuildContext context, String cabaniaName) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("¿Quieres reservar $cabaniaName?"),
          content:
              const Text("Estás a punto de hacer una reserva. ¿Confirmas?"),
          actions: <Widget>[
            TextButton(
              child: const Text("Cancelar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text("Confirmar"),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FormularioReservaScreen()),
                );
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 320,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Imperdibles del mes',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black54),
            ),
          ),
          Expanded(
            child: _novedades.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemCount: _novedades.length,
                    itemBuilder: (context, index) {
                      var novedad = _novedades[index];
                      return GestureDetector(
                          onTap: () {
                            _showReservationDialog(context, novedad['name']);
                          },
                          child: Card(
                            child: Container(
                              width: 300,
                              height: 300,
                              margin: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              alignment: Alignment.center,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: FadeInImage(
                                      placeholder: const AssetImage(
                                          'assets/loading.gif'),
                                      image: NetworkImage(novedad['image']),
                                      width: 300,
                                      height: 160,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Text(
                                    novedad['name'],
                                    style: const TextStyle(fontSize: 17),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(novedad['city']),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    novedad['price'],
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ));
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

class CardPoster extends StatelessWidget {
  final Size size;

  const CardPoster({
    Key? key,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: size.height * 0.35,
      child: const FadeInImage(
        placeholder: AssetImage('assets/loading.gif'),
        image: AssetImage('assets/images/intro.jpg'),
        fit: BoxFit.cover,
      ),
    );
  }
}
