import 'dart:convert';

import 'package:news_app/data/model/article.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static final String _baseUrl = "http://newsapi.org/v2/";
  static final String _apiKey = "185e8243b57c40d283abb9cbb1862b10";
  static final String _category = "business";
  static final String _country = "id";

  Future<ArticlesResult> topHeadlines() async {
    final url = Uri.parse(_baseUrl +
        "top-headlines?country=$_country&category=$_category&apiKey=$_apiKey");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return ArticlesResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load top headlines');
    }
  }
}
