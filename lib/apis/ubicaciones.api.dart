import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UbicacionesApi extends StatefulWidget {
  @override
  _UbicacionesApiState createState() => _UbicacionesApiState();
}

class _UbicacionesApiState extends State<UbicacionesApi> {
  List<dynamic> locations = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse('https://rickandmortyapi.com/api/location'));
    if (response.statusCode == 200) {
      setState(() {
        locations = json.decode(response.body)['results'];
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ubicaciones'),
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(locations[index]['name']),
            subtitle: Text('Type: ${locations[index]['type']}'),
          );
        },
      ),
    );
  }
}
