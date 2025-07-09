import 'package:app06/models/article_model.dart';
import 'package:app06/services/news_service.dart';
import 'package:app06/widgets/news_list_view.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class NewsListViewBuilder extends StatefulWidget {
  const NewsListViewBuilder({super.key});

  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
}

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
  var future;

  @override
  void initState() {
    future = NewsService(Dio()).getNews();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return NewsListView(articles: snapshot.data!);
        } else if (snapshot.hasError) {
          return SliverToBoxAdapter(
            child: Text(
              'OOPS , News Not Found !!',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          );
        } else {
          return SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }
}
