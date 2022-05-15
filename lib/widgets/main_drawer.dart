import 'package:flutter/material.dart';
import 'package:navigation_meals_app/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget menuFunctions(String title, IconData icon, Function() handlerSelect) {
    return ListTile(
      leading: Icon( icon, size: 26,),
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
      ),
      onTap: handlerSelect,
    );
  }

  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: Text(
              'Cooking Up',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          menuFunctions('Meals', Icons.restaurant, () {
            Navigator.pushReplacementNamed(context, '/');
          }),
          menuFunctions('Fliters', Icons.settings, () {
            Navigator.pushReplacementNamed(context, FiltersScreen.routName);
          }),
        ],
      ),
    );
  }
}
