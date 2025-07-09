import 'package:app06/models/article_model.dart';
import 'package:app06/widgets/news_tile.dart';
import 'package:flutter/material.dart';

class NewsListView extends StatelessWidget {
  final List<ArticleModel> articles;

  const NewsListView({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(childCount: articles.length, (
        context,
        index,
      ) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: NewsTile(articleModel: articles[index]),
        );
      }),
    );
  }
}
