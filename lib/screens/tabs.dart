import 'package:flutter/material.dart';
import 'package:navigator_setup/screens/meals.dart';

import '../models/meals.dart';
import '../widgets/main_drawer.dart';
import 'categories.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPage = 0;
  final List<Meal> _favoriteMeal = [];
  bool clickIcon = false;

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

  @override
  Widget build(BuildContext context) {
    Widget activeScreen = CategoriesScreen(
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
      drawer: const MainDrawer(),
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
