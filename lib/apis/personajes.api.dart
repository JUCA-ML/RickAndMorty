import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PersonajesApi extends StatefulWidget {
  const PersonajesApi({super.key});

  @override
  _PersonajesApiState createState() => _PersonajesApiState();
}

class _PersonajesApiState extends State<PersonajesApi> {
  List<dynamic> data = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = 
    await http.get(Uri.parse('https://rickandmortyapi.com/api/character'));
    
    if (response.statusCode == 200) {
      setState(() {
        data = json.decode(response.body)['results'];
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personajes'),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => Divider(color: Colors.grey),
        itemCount: data.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              data[index]['name'],
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Especie: ${data[index]['species']}',
                  style: TextStyle(fontSize: 16, color: Colors.blue[600]),
                ),
                Text(
                  'Estado: ${data[index]['status']}',
                  style: TextStyle(fontSize: 16.0, color: Color.fromARGB(255, 253, 127, 0)),
                ),
                Text(
                  'Origen: ${data[index]['origin']['name']}',
                  style: TextStyle(fontSize: 16.0, color: Color.fromARGB(255, 1, 255, 31)),
                ),
                Text(
                  'Genero: ${data[index]['gender']}',
                  style: TextStyle(fontSize: 16.0, color: Color.fromARGB(255, 1, 90, 255)),
                ),
              ],
            ),
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(data[index]['image']),
            ),
          );
        },
      ),
    );
  }
}
