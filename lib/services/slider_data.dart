import 'dart:convert';
import 'package:globalnews/models/slider_model.dart';
import 'package:http/http.dart' as http;

class Sliders {
  List<SliderModel> slider = [];

  Future<void> getSlider() async {
    String url =
        'https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=f6d7da6163a04167b90fd5cd6a1012bc';
    var response = await http.get(
      Uri.parse(url),
    );
    var jsonData = jsonDecode(response.body);
   // print(jsonData);
    if (jsonData['status'] == 'ok') {
    //  print('okay............................');
      jsonData['articles'].forEach((element) {
        if (element['url'] != null && element['description'] != null) {
          SliderModel sliderModel = SliderModel(
            author: element['author'],
            content: element['content'],
            description: element['description'],
            title: element['title'],
            url: element['url'],
            urlToImage: element['urlToImage'],
          );
          slider.add(sliderModel);
        }
      });
    }
   // print('not okay...................');
  }
}
