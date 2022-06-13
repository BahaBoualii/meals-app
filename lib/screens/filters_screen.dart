import 'package:flutter/material.dart';
import 'package:meals_app/items/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = 'filters-screen';
  Function setFilter;
  Map<String, bool> filters;

  FilterScreen(this.filters, this.setFilter);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  initState() {
    _glutenFree = widget.filters['gluten'] == true;
    _vegetarian = widget.filters['vegetarian'] == true;
    _lactoseFree = widget.filters['lactose'] == true;
    _vegan = widget.filters['vegan'] == true;
    super.initState();
  }

  Widget _buildSwitchTitle(String title, String description, bool currentValue,
      void Function(bool) updateValue) {
    return SwitchListTile(
      value: currentValue,
      onChanged: updateValue,
      title: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(description),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Filters'), actions: [
          IconButton(
              onPressed: (() {
                final Map<String, bool> selectedFilters = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian
                };
                widget.setFilter(selectedFilters);
              }),
              icon: const Icon(Icons.save))
        ]),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: const Text(
                'Adjust your meal selection',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
                child: ListView(
              children: [
                _buildSwitchTitle('Gluten-Free',
                    'Only contains Gluten-Free meals', _glutenFree, (newValue) {
                  setState(() {
                    _glutenFree = newValue;
                  });
                }),
                _buildSwitchTitle(
                    'Lactose-Free',
                    'Only contains Lactose-Free meals',
                    _lactoseFree, (newValue) {
                  setState(() {
                    _lactoseFree = newValue;
                  });
                }),
                _buildSwitchTitle(
                    'Vegetarian', 'Only contains Vegetarian meals', _vegetarian,
                    (newValue) {
                  setState(() {
                    _vegetarian = newValue;
                  });
                }),
                _buildSwitchTitle('Vegan', 'Only contains Vegan meals', _vegan,
                    (newValue) {
                  setState(() {
                    _vegan = newValue;
                  });
                })
              ],
            ))
          ],
        ));
  }
}
