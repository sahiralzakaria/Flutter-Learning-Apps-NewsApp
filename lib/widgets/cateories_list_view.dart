import 'package:app06/models/category_model.dart';
import 'package:app06/widgets/category_card.dart';
import 'package:flutter/material.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({super.key});

  final List<CategoryModel> Categories = const [
    CategoryModel(image: 'assets/general.avif', CateogryName: 'general'),
    CategoryModel(image: 'assets/sports.avif', CateogryName: 'sports'),
    CategoryModel(image: 'assets/science.avif', CateogryName: 'science'),
    CategoryModel(image: 'assets/health.avif', CateogryName: 'health'),
    CategoryModel(image: 'assets/technology.jpeg', CateogryName: 'technology'),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: Categories.length,
        itemBuilder: (cotext, index) {
          return CategoryCard(category: Categories[index]);
        },
      ),
    );
  }
}
