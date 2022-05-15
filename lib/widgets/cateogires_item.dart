import 'package:flutter/material.dart';
import 'package:navigation_meals_app/screens/categories_screen.dart';
import 'package:navigation_meals_app/screens/meals_screen_categories.dart';


class CategoriesItem extends StatelessWidget {

  final String id;
  final String title;
  final Color color;

  CategoriesItem( this.id,  this.title,  this.color);

  void selectedInkwell(BuildContext context) {
    // Navigator.of(context).push(MaterialPageRoute(builder: (context) => CategoriesScreen()));
    Navigator.of(context).pushNamed(MealsScreenCategories.routName, arguments: {'id': id, 'title': title});
  }
  
  // const CategoriesWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: (context) => selectedInkwell(context),
      onTap: () => selectedInkwell(context),
      child: Container(

        child: Center(
          child: Text(title, style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),),
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color.withOpacity(0.7), color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight, 
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}