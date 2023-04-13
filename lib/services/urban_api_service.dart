import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<dynamic>> fetchUrbanData(String term) async {
  final response = await http
      .get(Uri.parse('https://api.urbandictionary.com/v0/define?term=$term'));
  if (response.statusCode == 200) {
    return jsonDecode(response.body)['list'];
  } else {
    throw Exception('Veri çekilemedi');
  }
}
