import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';
  // final String categoryId;
  // final String categoryTitle;
  // CategoryMealsScreen({this.categoryId, this.categoryTitle});
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final String categoryId = routeArgs['id'];
    final String categoryTitle = routeArgs['title'];
    final categoryMeal = DUMMY_MEALS
        .where(
          (meal) => meal.categories.contains(categoryId),
        )
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Container(
        color: Colors.white,
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              title: categoryMeal[index].title,
              imageUrl: categoryMeal[index].imageUrl,
              duration: categoryMeal[index].duration,
              complexcity: categoryMeal[index].complexcity,
              affordability: categoryMeal[index].affordability,
            );
          },
          itemCount: categoryMeal.length,
        ),
      ),
    );
  }
}
