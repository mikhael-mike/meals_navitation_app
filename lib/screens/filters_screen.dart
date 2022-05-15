import 'package:flutter/material.dart';
import 'package:navigation_meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatelessWidget {
  static final routName = '/filter-screen';
  const FiltersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Your filters')),
      drawer: MainDrawer(),
      body: Center(child: Text('Filters screen')),
    );
    
  }
}
