import 'package:flutter/material.dart';
import 'package:navigation_meals_app/jsons_files/dummy_categories.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  Widget BuildSectionTitle(BuildContext context, String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
              width: 5, style: BorderStyle.solid, color: Colors.green)),
      height: 200,
      width: 300,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(15),
      child: child,
    );
  }

  const MealDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeId = ModalRoute.of(context)!.settings.arguments as String;
    final mealDetailId = DUMMY_MEALS.firstWhere((meal) => meal.id == routeId);
    return Scaffold(
      appBar: AppBar(
        title: Text(mealDetailId.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                mealDetailId.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            BuildSectionTitle(context, 'Ingredients'),
            buildContainer(
              ListView.builder(
                itemBuilder: ((context, index) => Card(
                      color: Colors.yellowAccent,
                      child: Padding(
                          padding: EdgeInsets.all(15),
                          child: Text(mealDetailId.ingredients[index])),
                    )),
                itemCount: mealDetailId.ingredients.length,
              ),
            ),
            BuildSectionTitle(context, 'Steps'),
            buildContainer(ListView.builder(
              itemBuilder: (context, index) => ListTile(
                leading: CircleAvatar(
                  child: Text('#${index + 1}'),
                ),
                title: Text(mealDetailId.steps[index]),
              ),
              itemCount: mealDetailId.steps.length,
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete),
        onPressed: () => Navigator.pop(context, mealDetailId),
      ),
    );
  }
}
