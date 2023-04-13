import 'package:flutter/material.dart';

import '../services/search_service.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();
  List<dynamic> _data = [];

  void _search(String term) async {
    final data = await search(term);
    setState(() {
      _data = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sözlük Ara (Urban)'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Kelime giriniz (enter a word)',
              ),
              onChanged: (term) {
                _search(term);
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_data[index]['word']),
                  subtitle: Text(_data[index]['definition']),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
