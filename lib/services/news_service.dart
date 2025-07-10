import 'package:app06/models/article_model.dart';
import 'package:app06/secret.dart';
import 'package:dio/dio.dart';

class NewsService {
  final Dio dio;

  NewsService(this.dio);

  Future<List<ArticleModel>> getTopHeadlines({required String category}) async {
    try {
      var response = await dio.get('$apiKey&category=$category');

      Map<String, dynamic> jsonData = response.data;
      List<dynamic> articles = jsonData['articles'];
      List<ArticleModel> articlesList = [];

      for (var article in articles) {
        ArticleModel articleModel = ArticleModel.fromJson(article);

        articlesList.add(articleModel);
      }
      return articlesList;
    } catch (e) {
      return [];
    }
  }
}
