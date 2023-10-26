import 'package:flutter/material.dart';
import 'package:login/apis/episodios.api.dart';
import 'package:login/apis/personajes.api.dart';
import 'package:login/apis/ubicaciones.api.dart';

class MenuApis extends StatefulWidget {
  const MenuApis({super.key, required this.title});

  final String title;

  @override
  State<MenuApis> createState() => _MenuApisState();
}

class _MenuApisState extends State<MenuApis> {
  List<dynamic> data = [];

  void goSimpleAPI() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const PersonajesApi()),
    );
  }

  void goSimpleListPokemon() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EpisodiosApi()),
    );
  }

  void goDetailPokemon() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => UbicacionesApi()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rick and Morty'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BotonFacha(
              text: 'Personajes',
              onPressed: goSimpleAPI,
            ),
            const SizedBox(height: 20),
            BotonFacha(
              text: 'Episodios',
              onPressed: goSimpleListPokemon,
            ),
            const SizedBox(height: 20),
            BotonFacha(
              text: 'Ubicaciones',
              onPressed: goDetailPokemon,
            ),
          ],
        ),
      ),
    );
  }
}

class BotonFacha extends StatelessWidget {
    final String text;
    final VoidCallback onPressed;

    const BotonFacha({
      required this.text,
      required this.onPressed,
    });

    @override
    Widget build(BuildContext context) {
      return InkWell(
        onTap: onPressed,
        child: Ink(
          width: 200,
          height: 60,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 23, 150, 255),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: const Color.fromARGB(255, 255, 255, 255),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      );
    }
  }
