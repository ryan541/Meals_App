import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:navigator_setup/data/dummy_data.dart';
import 'package:navigator_setup/providers/meals_provider.dart';
import 'package:navigator_setup/screens/filter.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  veganFree,
  vegeterianFree,
}

class FiltersNotifier extends StateNotifier<Map<Filter, bool>> {
  FiltersNotifier()
      : super({
          Filter.glutenFree: false,
          Filter.lactoseFree: false,
          Filter.veganFree: false,
          Filter.vegeterianFree: false,
        });

  void setFilters(Map<Filter, bool> chosenFilters) {
    state = chosenFilters;
  }

  void setFilter(Filter filter, bool isActive) {
    //state[filter] = isActive; //not allowed since you are mutating the state
    state = {
      ...state,
      filter: isActive,
    };
  }
}

final filtersProvider =
    StateNotifierProvider<FiltersNotifier, Map<Filter, bool>>(
        (ref) => FiltersNotifier());

//dependent provider
final filteredMealsProvider = Provider((ref) {
  final meals = ref.watch(mealsProvider);
  final activeFilters = ref.watch(filtersProvider);
  return dummyMeals.where((meal) {
    if (activeFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
      return false;
    }
    if (activeFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
      return false;
    }
    if (activeFilters[Filter.veganFree]! && !meal.isVegan) {
      return false;
    }
    if (activeFilters[Filter.vegeterianFree]! && !meal.isVegetarian) {
      return false;
    }
    return true;
  }).toList();
});
