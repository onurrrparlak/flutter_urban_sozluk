import 'urban_api_service.dart';

Future<List<dynamic>> search(String term) async {
  final data = await fetchUrbanData(term);
  return data;
}
