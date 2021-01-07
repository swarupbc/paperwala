import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:paperwala/constanse/strings.dart';
import 'package:paperwala/models/news_model.dart';

class APImanager {
  Future<NewsModel> getNews() async {
    var client = http.Client();
    var newsModel;
    try {
      var response = await client.get(Strings.newsUrl);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);
        newsModel = NewsModel.fromJson(jsonMap);
      }
    } catch (e) {
      return newsModel;
    }
    return newsModel;
  }
}
