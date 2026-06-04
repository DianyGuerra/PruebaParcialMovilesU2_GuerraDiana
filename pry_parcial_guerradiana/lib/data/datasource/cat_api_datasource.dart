import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/cat_model.dart';

class CatApiDataSource {
  final String baseURL = "https://api.thecatapi.com/v1/images/search";

  Future<List<CatModel>> fetchCats(int limit) async {
    final url = Uri.parse("$baseURL?limit=$limit");

    final res = await http.get(url);

    if (res.statusCode != 200) {
      throw Exception("Error al cargar los gatos");
    }

    final data = json.decode(res.body);
    final List results = data;
    return results.map((e) => CatModel.fromJson(e)).toList();
  }
}
