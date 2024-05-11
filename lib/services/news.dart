import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:globalnews/models/article_model.dart';
import 'package:http/http.dart' as http;



class News {
  List<ArticleModel> news = [];

  Future<void> getNews() async {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd').format(now);
    String url =
        'https://newsapi.org/v2/everything?q=tesla&from=${formattedDate}&sortBy=publishedAt&apiKey=f6d7da6163a04167b90fd5cd6a1012bc';
    var response = await http.get(
      Uri.parse(url),
    );
    var jsonData = jsonDecode(response.body);
    print(jsonData);
    if (jsonData['status'] == 'ok') {
      print('okay.....................');
      jsonData['articles'].forEach((element) {
        if (element['url'] != null && element['description'] != null) {
          ArticleModel articleModel = ArticleModel(
            author: element['author'],
            content: element['content'],
            description: element['description'],
            title: element['title'],
            url: element['url'],
            urlToImage: element['urlToImage'],
          );
          news.add(articleModel);
        }
      });
    }
    // print('not okay.....................');
  }
}
