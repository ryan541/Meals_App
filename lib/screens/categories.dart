import 'package:flutter/material.dart';
import 'package:navigator_setup/screens/meals.dart';

import '../data/dummy_data.dart';
import '../models/category.dart';
import '../models/meals.dart';
import '../widgets/category_grid_item.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen(
      {super.key,
      //required this.onToggleFavorite,
      required this.availableMeals});
  //final void Function(Meal meal) onToggleFavorite;
  final List<Meal> availableMeals;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      lowerBound: 0,
      upperBound: 1,
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  _selectCategory(BuildContext context, Category category) {
    final filteredMeals = widget.availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: ((context) => MealsScreen(
              //onToggleFavorite: onToggleFavorite,
              title: category.title,
              meals: filteredMeals,
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      child: GridView(
        padding: const EdgeInsets.all(24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.5,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          //alternative is using the map
          //availableCategories.map((category) => CategoryGridItem(category : category)).toList(),
          for (final category in availableCategories)
            CategoryGridItem(
              category: category,
              onSelectCategory: () {
                _selectCategory(context, category);
              },
            )
        ],
      ),
      builder: (context, child) => Padding(
          padding: EdgeInsets.only(top: 100 - _animationController.value * 100),
          child: child),
    );
  }
}
