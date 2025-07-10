import 'package:app06/models/category_model.dart';
import 'package:app06/views/category_view.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return CategoryView(category: category.CateogryName);
            },
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          height: 120,
          width: 210,
          decoration: BoxDecoration(
            color: Colors.amber,
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(category.image),
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Text(
              category.CateogryName,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
