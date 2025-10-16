import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:news_app/models/Allnews.dart';

class Apiservices {
  static Future<NewsResponse?> getdata() async {
    final url = Uri.parse(
      'https://newsapi.org/v2/top-headlines?country=us&apiKey=00d6296a177f4b7ea226e7cd08f5d679',
    );
    final response = await http.get(url);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      final Map<String, dynamic> jsondata = jsonDecode(response.body);

      NewsResponse responseall = NewsResponse.fromJson(jsondata);

      return responseall;
    }
  }

  static Future<NewsResponse?> getcategory({required String category}) async {
    final url = Uri.parse(
      'https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=00d6296a177f4b7ea226e7cd08f5d679',
    );
    final response = await http.get(url);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      final Map<String, dynamic> jsondata = jsonDecode(response.body);

      NewsResponse responseall = NewsResponse.fromJson(jsondata);

      return responseall;
    }
  }

  static Future<NewsResponse?> getsearch({required String search}) async {
    final url = Uri.parse(
      'https://newsapi.org/v2/top-headlines?q=$search&apiKey=00d6296a177f4b7ea226e7cd08f5d679',
    );
    final response = await http.get(url);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      final Map<String, dynamic> jsondata = jsonDecode(response.body);

      NewsResponse responseall = NewsResponse.fromJson(jsondata);

      return responseall;
    }
  }
}
