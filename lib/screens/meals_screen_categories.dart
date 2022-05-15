import 'package:flutter/material.dart';
import 'package:navigation_meals_app/jsons_files/dummy_categories.dart';
import 'package:navigation_meals_app/widgets/cateogires_item.dart';
import 'package:navigation_meals_app/widgets/meal_item.dart';

import '../models/meals.dart';

class MealsScreenCategories extends StatefulWidget {
  static const routName = 'category-meals';
  const MealsScreenCategories({Key? key}) : super(key: key);

  @override
  State<MealsScreenCategories> createState() => _MealsScreenCategoriesState();
}

class _MealsScreenCategoriesState extends State<MealsScreenCategories> {
  late String categoryTitle;
  late List<Meal> displayMeals;
  bool _loadInitData = false;

  @override
  void initState() {
    // TODO: implement initState
    // ...
  }

  @override
  void didChangeDependencies() {
    if (!_loadInitData) {
      final routeArgs =
          ModalRoute.of(context)!.settings.arguments as Map<String, String>;
      final categoryTitle = routeArgs['title'];
      final categoryId = routeArgs['id'];
      displayMeals = DUMMY_MEALS.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadInitData = true;
    }
    // TODO: implement didChangeDependencies

    // super.initState();
    super.didChangeDependencies();
  }

  void _removeId(String mealId) {
    setState(() {
      displayMeals.removeWhere((meal) => meal.id == meal);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: displayMeals[index].id,
            title: displayMeals[index].title,
            imageUrl: displayMeals[index].imageUrl,
            duration: displayMeals[index].duration,
            complexity: displayMeals[index].complexity,
            affordability: displayMeals[index].affordability,
            removeItem: _removeId,
          );
        },
        itemCount: displayMeals.length,
      ),
    );
  }
}
