import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:navigator_setup/providers/favorites_provider.dart';

import '../models/meals.dart';

class MealDetailsScreen extends ConsumerStatefulWidget {
  const MealDetailsScreen({
    super.key,
    required this.meal,
    //required this.onToggleFavorite
  });
  final Meal meal;

  //final void Function(Meal meal) onToggleFavorite;

  @override
  ConsumerState<MealDetailsScreen> createState() => _MealDetailsScreenState();
}

class _MealDetailsScreenState extends ConsumerState<MealDetailsScreen> {
  bool flipIcon = false;

  @override
  Widget build(BuildContext context) {
    final favoriteMeals = ref.watch(favoriteMealsProvider);
    final isFavorite = favoriteMeals.contains(widget.meal);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.meal.title),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                flipIcon = !flipIcon;
              });
              // widget.onToggleFavorite(widget.meal);
              final wasAdded = ref
                  .read(favoriteMealsProvider.notifier)
                  .toggleMealFavoriteStatus(widget.meal);
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                      wasAdded ? 'Meal added as a favorite.' : 'Meal removed.'),
                ),
              );
            },
            icon: Icon(isFavorite ? Icons.star : Icons.star_border),
            // icon: flipIcon
            //     ? const Icon(Icons.star)
            //     : const Icon(Icons.star_border),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              widget.meal.imageUrl,
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Ingredients',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
            const SizedBox(
              height: 10,
            ),
            for (final ingredient in widget.meal.ingredients)
              Text(
                ingredient,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Steps : ',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
            for (final step in widget.meal.steps)
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                child: Text(
                  textAlign: TextAlign.center,
                  step,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
