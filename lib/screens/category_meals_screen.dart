import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widgets/meal_item.dart';
import '../Model/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';
  final List<Meal> avilableMeal;
  CategoryMealsScreen(this.avilableMeal);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  List<Meal> _mealDisplay;
  String _categoryTitle;
  var _loadedData = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_loadedData) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      final String categoryId = routeArgs['id'];
      _categoryTitle = routeArgs['title'];
      _mealDisplay = widget.avilableMeal
          .where(
            (meal) => meal.categories.contains(categoryId),
          )
          .toList();
      _loadedData = true;
    }
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      _mealDisplay.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: _mealDisplay[index].id,
            title: _mealDisplay[index].title,
            imageUrl: _mealDisplay[index].imageUrl,
            duration: _mealDisplay[index].duration,
            complexcity: _mealDisplay[index].complexcity,
            affordability: _mealDisplay[index].affordability,
          );
        },
        itemCount: _mealDisplay.length,
      ),
    );
  }
}
