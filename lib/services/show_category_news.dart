import 'dart:convert';
import 'package:globalnews/models/show_category.dart';
// import 'package:globalnews/models/slider_model.dart';
import 'package:http/http.dart' as http;

class ShowCategoryNews {
  List<ShowCategoryModel> categories = [];

  Future<void> getCategories(String category) async {
    String url =
        'https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=f6d7da6163a04167b90fd5cd6a1012bc';
    var response = await http.get(
      Uri.parse(url),
    );
    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == 'ok') {
      print('okay......................');
      jsonData['articles'].forEach((element) {
        if (element['url'] != null && element['description'] != null) {
          ShowCategoryModel showCategoryModel = ShowCategoryModel(
            author: element['author'],
            content: element['content'],
            description: element['description'],
            title: element['title'],
            url: element['url'],
            urlToImage: element['urlToImage'],
          );
          categories.add(showCategoryModel);
        }
      });
    }
  }
}
