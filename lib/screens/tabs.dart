import 'package:flutter/material.dart';
import 'package:navigator_setup/data/dummy_data.dart';
import 'package:navigator_setup/screens/filter.dart';
import 'package:navigator_setup/screens/meals.dart';

import '../models/meals.dart';
import '../widgets/main_drawer.dart';
import 'categories.dart';

const kInitialFilters = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.veganFree: false,
  Filter.vegeterianFree: false,
};

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPage = 0;
  final List<Meal> _favoriteMeal = [];
  bool clickIcon = false;

  Map<Filter, bool> _selectedFilters = kInitialFilters;

  void _showMessageBar(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  _selectPage(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  _toggleMeal(Meal meal) {
    final isExisting = _favoriteMeal.contains(meal);

    if (isExisting) {
      setState(() {
        _favoriteMeal.remove(meal);
      });
      _showMessageBar('Meal Removed From Favorites');
    } else {
      setState(() {
        _favoriteMeal.add(meal);
        _showMessageBar('Meal Added to Favorites');
      });
    }
  }

  void _setScreen(String identifier) async {
    if (identifier == 'filters') {
      Navigator.of(context).pop();
      final result = await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (context) => FilterScreen(currentFilters: _selectedFilters),
        ),
      );

      //print("The result is : $result");
      setState(() {
        _selectedFilters = result ?? kInitialFilters;
      });
    } else {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals = dummyMeals.where((meal) {
      if (_selectedFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (_selectedFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (_selectedFilters[Filter.veganFree]! && !meal.isVegan) {
        return false;
      }
      if (_selectedFilters[Filter.vegeterianFree]! && !meal.isVegetarian) {
        return false;
      }
      return true;
    }).toList();

    Widget activeScreen = CategoriesScreen(
      availableMeals: availableMeals,
      onToggleFavorite: _toggleMeal,
    );
    var activeTitle = 'Categories';

    if (_selectedPage == 1) {
      activeScreen = MealsScreen(
        meals: _favoriteMeal,
        onToggleFavorite: _toggleMeal,
      );
      activeTitle = 'Your Favorites';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activeTitle),
      ),
      drawer: MainDrawer(onSelectedScreen: _setScreen),
      body: activeScreen,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPage,
        onTap: _selectPage,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal_sharp),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.star),
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
