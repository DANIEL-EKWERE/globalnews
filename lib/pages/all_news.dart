import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:globalnews/models/article_model.dart';
import 'package:globalnews/models/slider_model.dart';
import 'package:globalnews/pages/article_views.dart';
import 'package:globalnews/services/news.dart';
import 'package:globalnews/services/slider_data.dart';

class AllNews extends StatefulWidget {
  final String news;
  const AllNews({super.key, required this.news});

  @override
  State<AllNews> createState() => _AllNewsState();
}

class _AllNewsState extends State<AllNews> {
  List<SliderModel> sliders = [];
  List<ArticleModel> articles = [];
  bool _loading = true;
  getNews() async {
    News newsClass = News();
    await newsClass.getNews();
    articles = newsClass.news;
    setState(() {
      bool _loading = false;
    });
  }

  getSlider() async {
    Sliders sliderClass = Sliders();
    await sliderClass.getSlider();
    sliders = sliderClass.slider;
    setState(() {
      bool _loading = false;
    });
  }

  @override
  void initState() {
    getSlider();
    getNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${widget.news} News',
          style: const TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10.0),
        child: ListView.builder(
          physics: const ClampingScrollPhysics(),
          shrinkWrap: true,
          itemCount: widget.news.toLowerCase() == 'breaking'
              ? sliders.length
              : articles.length,
          itemBuilder: (context, index) {
            return AllNewsSection(
              image: widget.news.toLowerCase() == 'breaking'
                  ? sliders[index].urlToImage!
                  : articles[index].urlToImage!,
              desc: widget.news.toLowerCase() == 'breaking'
                  ? sliders[index].description!
                  : articles[index].description!,
              title: widget.news.toLowerCase() == 'breaking'
                  ? sliders[index].title!
                  : articles[index].title!,
              url: widget.news.toLowerCase() == 'breaking'
                  ? sliders[index].url!
                  : articles[index].url!,
              urlToImage: widget.news.toLowerCase() == 'breaking'
                  ? sliders[index].urlToImage!
                  : articles[index].urlToImage!,
            );
          },
        ),
      ),
    );
  }
}

class AllNewsSection extends StatelessWidget {
  final String image, desc, title, url, urlToImage;
  const AllNewsSection(
      {required this.image,
      required this.desc,
      required this.title,
      required this.url,
      required this.urlToImage,
      super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => ArticleView(blogUrl: url),
            ));
      },
      child: Container(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl: image,
                width: MediaQuery.of(context).size.width,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              desc,
              style: const TextStyle(color: Colors.black54, fontSize: 16),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
