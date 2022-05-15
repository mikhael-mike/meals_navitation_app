import 'package:flutter/material.dart';
import 'package:navigation_meals_app/screens/categories_screen.dart';
import 'package:navigation_meals_app/screens/filters_screen.dart';
import 'package:navigation_meals_app/screens/meal_detail_screen.dart';
import 'package:navigation_meals_app/screens/meals_screen_categories.dart';
import 'package:navigation_meals_app/screens/tabs_screen.dart';

void main() => runApp(MaterialApp(
  theme: ThemeData(accentColor: Colors.blue),
  
  initialRoute: '/',
  routes: {
    // '/':(context) => TabsScreen(),
    MealsScreenCategories.routName :(context) => MealsScreenCategories(),
    MealDetailScreen.routeName : ((context) => MealDetailScreen()),
    FiltersScreen.routName: ((context) => FiltersScreen()),
  },
  home: MyApp(),
  onGenerateRoute: (settings) {
    print(settings.arguments);
    return MaterialPageRoute(builder: (context) => CategoriesScreen());
  },
));


class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: TabsScreen(),
      
    );
  }
}