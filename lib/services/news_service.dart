import 'package:app06/models/article_model.dart';
import 'package:dio/dio.dart';
import 'package:app06/secret.dart';

class NewsService {
  final Dio dio;

  NewsService(this.dio);

  Future<List<ArticleModel>> getNews() async {
    var response = await dio.get(apiKey);

    Map<String, dynamic> jsonData = response.data;
    List<dynamic> articles = jsonData['articles'];
    List<ArticleModel> articlesList = [];

    for (var article in articles) {
      ArticleModel articleModel = ArticleModel(
        source: Source(
          id: article['source']['id'] ?? 'unknown',
          name: article['source']['name'] ?? 'Unknown Source',
        ),
        image: article['urlToImage'],
        title: article['title'] ?? 'No Title',
        subTitle: article['description'],
      );

      articlesList.add(articleModel);
    }
    return articlesList;
  }
}
