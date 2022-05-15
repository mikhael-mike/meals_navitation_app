import 'package:flutter/material.dart';
import 'package:navigation_meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static final routName = '/filter-screen';
  // const FiltersScreen({Key? key}) : super(key: key);

  final Function() saveFilter;

  FiltersScreen(this.saveFilter);


  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool __vegetarian = false;
  bool _vegan = false;
  bool _LactoseFree = false;

  Widget _buildSwitchTitle(String title, String description, bool currenctValue,
      Function(bool) updateValue) {
    return SwitchListTile(
        title: Text(title),
        subtitle: Text(description),
        value: currenctValue,
        onChanged: updateValue
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your filters'),
        actions: <Widget>[
          IconButton(onPressed: widget.saveFilter, icon: Icon(Icons.save)),
        ],
        ),
      drawer: MainDrawer(),
    
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: TextStyle(fontSize: 30),
            ),
          ),
          Expanded(
              child: ListView(
            children: <Widget>[
              _buildSwitchTitle('Gluten-Free', 'Only include Gluten-free meals', _glutenFree, (newValue) {
                setState(() {
                  _glutenFree = newValue;
                });
              }),
              _buildSwitchTitle('Lactose-Free', 'Only include Lactose-free meals', _LactoseFree, (newValue) {
                setState(() {
                  _LactoseFree = newValue;
                });
              }),
              _buildSwitchTitle('Vegetarian', 'Only include Vegetarian meals', __vegetarian, (newValue) {
                setState(() {
                  __vegetarian = newValue;
                });
              }),
              _buildSwitchTitle('Vegan', 'Only include Vegen meals', _vegan, (newValue) {
                setState(() {
                  _vegan = newValue;
                });
              }),
            ],
          ))
        ],
      ),
    );
  }
}
