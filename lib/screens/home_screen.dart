import 'package:flutter/material.dart';
import '../widgets/drawer_menu.dart';

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
              'CabaniasArg es la mejor app para encontrar cabañas en Argentina! Ya sea para venta o alquiler, en CabaniasArg vas a encontrar las mejores opciones y al mejor precio',
            )
          ],
        ));
  }
}

class CardSwiper extends StatelessWidget {
  final List _castMovies = <Map<String, String>>[
    {
      'image':
          'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/86jeYFV40KctQMDQIWhJ5oviNGj.jpg',
      'actor': 'Emilia Clarke',
      'name': 'Daenerys Targaryen',
      'duration':
          '80 episodios.80 episodios.80 episodios.80 episodios.80 episodios.80 episodios.80 episodios.'
    },
    {
      'image':
          'https://www.themoviedb.org/t/p/w138_and_h175_face/htGBMno71BJAEGF3Y9f62MdA3Yt.jpg',
      'actor': 'Kit Harington',
      'name': 'Jon Snow',
      'duration': '80 episodios'
    },
    {
      'image':
          'https://www.themoviedb.org/t/p/w138_and_h175_face/lRsRgnksAhBRXwAB68MFjmTtLrk.jpg',
      'actor': 'Peter Dinklage',
      'name': 'Tyrion Lannister',
      'duration': '79 episodios'
    },
    {
      'image':
          'https://www.themoviedb.org/t/p/w138_and_h175_face/n9zXQhjtXQnc30kqF66hdX4i3PG.jpg',
      'actor': 'Iain Glen',
      'name': 'Jorah Mormont',
      'duration': '79 episodios'
    },
    {
      'image':
          'https://www.themoviedb.org/t/p/w138_and_h175_face/5SL4Y4alOYF9EahObfsb6GaDHg4.jpg',
      'actor': 'Lena Headey',
      'name': 'Cersei Lannister',
      'duration': '77 episodios'
    },
    {
      'image':
          'https://www.themoviedb.org/t/p/w138_and_h175_face/zopxZsUZmxZ4sGEfm4cRr7FVoM4.jpg',
      'actor': 'Sophie Turner',
      'name': 'Sansa Stark',
      'duration': '76 episodios'
    },
    {
      'image':
          'https://www.themoviedb.org/t/p/w138_and_h175_face/puWXJbe5ZGnOqJhVr9lEgstvygy.jpg',
      'actor': 'Maisie Williams',
      'name': 'Arya Stark',
      'duration': '75 episodios'
    },
    {
      'image':
          'https://www.themoviedb.org/t/p/w138_and_h175_face/7gPpG0TBMX20tPhWC8BT47x2lnh.jpg',
      'actor': 'Alfie Allen',
      'name': 'Theon Greyjoy',
      'duration': '74 episodios'
    },
    {
      'image':
          'https://www.themoviedb.org/t/p/w138_and_h175_face/zRc8eGN3aFjDapoAKpzWBYBFxCr.jpg',
      'actor': 'Conleth Hill',
      'name': 'Lord Varys, Varys',
      'duration': '72 episodios'
    },
  ];

  CardSwiper({
    Key? key,
  }) : super(key: key);

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
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: _castMovies.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Container(
                      width: 150,
                      height: 180,
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      alignment: Alignment.center,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: FadeInImage(
                              placeholder:
                                  const AssetImage('assets/loading.gif'),
                              image: NetworkImage(_castMovies[index]['image']),
                              width: 140,
                              height: 160,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Text(
                            _castMovies[index]['actor'],
                            style: const TextStyle(fontSize: 17),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(_castMovies[index]['name']),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            _castMovies[index]['duration'],
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ));
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
