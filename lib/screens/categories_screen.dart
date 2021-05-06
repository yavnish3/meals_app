import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meals App'),
      ),
      body: Container(
        color: Colors.white,
        child: GridView(
          padding: const EdgeInsets.all(20.0),
          children: DUMMY_CATEGORIES
              .map(
                (e) => CategoryItem(
                  e.id,
                  e.title,
                  e.color,
                ),
              )
              .toList(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
        ),
      ),
    );
  }
}
