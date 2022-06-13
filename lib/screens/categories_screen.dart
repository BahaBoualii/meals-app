import 'package:flutter/material.dart';
import '../dummy_values.dart';
import '../items/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
      children: DUMMY_CATEGORIES
          .map((e) => CategoryItem(e.id, e.title, e.color))
          .toList(),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 3 / 2),
    );
  }
}
