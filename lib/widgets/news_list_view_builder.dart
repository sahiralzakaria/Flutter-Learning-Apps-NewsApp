import 'package:app06/models/article_model.dart';
import 'package:app06/services/news_service.dart';
import 'package:app06/widgets/news_list_view.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class NewsListViewBuilder extends StatelessWidget {
  const NewsListViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: NewsService(Dio()).getNews(),
      builder: (context, snapshot) {
        return NewsListView(articles: snapshot.data ?? []);
      },
    );
  }
}
