import 'package:flutter/material.dart';
import 'package:meals_app/items/meal_item.dart';
import '../dummy_values.dart';
import '../models/meal.dart';

class CategoryMealScreen extends StatelessWidget {
  static const String routeName = '/category-meal';

  final List<Meal> availableMeals;

  CategoryMealScreen(this.availableMeals);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final CategoryId = routeArgs['id'];
    final CatgoryTitle = routeArgs['title'];
    final CategoryMeals = availableMeals.where(
      (element) {
        return element.categories.contains(CategoryId);
      },
    ).toList();
    return Scaffold(
      appBar: AppBar(title: Text(CatgoryTitle!)),
      body: ListView.builder(
          itemBuilder: (context, index) {
            return MealItem(
                id: CategoryMeals[index].id,
                title: CategoryMeals[index].title,
                imageUrl: CategoryMeals[index].imageUrl,
                duration: CategoryMeals[index].duration,
                affordability: CategoryMeals[index].affordability,
                complexity: CategoryMeals[index].complexity);
          },
          itemCount: CategoryMeals.length),
    );
  }
}
