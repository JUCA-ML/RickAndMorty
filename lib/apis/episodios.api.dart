import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EpisodiosApi extends StatefulWidget {
  @override
  _EpisodiosApiState createState() => _EpisodiosApiState();
}

class _EpisodiosApiState extends State<EpisodiosApi> {
  List<dynamic> episodes = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse('https://rickandmortyapi.com/api/episode'));
    if (response.statusCode == 200) {
      setState(() {
        episodes = json.decode(response.body)['results'];
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Episodios'),
      ),
      body: ListView.builder(
        itemCount: episodes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(episodes[index]['name']),
            subtitle: Text('Episodio: ${episodes[index]['episode']}'),
          );
        },
      ),
    );
  }
}
