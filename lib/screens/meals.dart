import 'package:flutter/material.dart';
import 'package:navigator_setup/screens/meals_details.dart';
import 'package:navigator_setup/widgets/meal_item.dart';

import '../models/meals.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    this.title,
    required this.meals,
    //required this.onToggleFavorite
  });

  final String? title;
  final List<Meal> meals;
  //final void Function(Meal meal) onToggleFavorite;

  void _selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MealDetailsScreen(
          //onToggleFavorite: onToggleFavorite,
          meal: meal,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Uh oh ... Nothing Here Bro',
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Try selecting a different category! ',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
        ],
      ),
    );

    if (meals.isNotEmpty) {
      content = ListView.builder(
        itemCount: meals.length,
        // itemBuilder: (ctx, index) => Text(
        //   meals[index].title,
        // ),
        itemBuilder: (ctx, index) => MealItem(
          onSelectedMeal: (meal) {
            _selectMeal(context, meal);
          },
          meal: meals[index],
        ),
      );
    }

    if (title == null) {
      return content;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: content,
    );
  }
}
