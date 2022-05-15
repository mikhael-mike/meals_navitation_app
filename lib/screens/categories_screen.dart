import 'package:flutter/material.dart';
import 'package:navigation_meals_app/jsons_files/dummy_categories.dart';
import 'package:navigation_meals_app/widgets/cateogires_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GridView(
        padding: EdgeInsets.all(25),
        children: DUMMY_CATEGORIES
            .map((data) => CategoriesItem(data.id, data.title, data.color))
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          mainAxisSpacing: 30,
          mainAxisExtent: 40,
        ),
      );
  }
}
