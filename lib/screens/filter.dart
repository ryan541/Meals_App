import 'package:flutter/material.dart';
import 'package:navigator_setup/screens/tabs.dart';
import 'package:navigator_setup/widgets/main_drawer.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  veganFree,
  vegeterianFree,
}

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key, required this.currentFilters});
  final Map<Filter, bool> currentFilters;

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _glutenFreeFilterText = false;
  var _lactoseFreeFilterText = false;
  var _veganFreeFilterText = false;
  var _vegeterianFreeFilterText = false;

  @override
  void initState() {
    _glutenFreeFilterText = widget.currentFilters[Filter.glutenFree]!;
    _lactoseFreeFilterText = widget.currentFilters[Filter.lactoseFree]!;
    _veganFreeFilterText = widget.currentFilters[Filter.veganFree]!;
    _vegeterianFreeFilterText = widget.currentFilters[Filter.vegeterianFree]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      // drawer: MainDrawer(onSelectedScreen: (identifier) {
      //   if (identifier == 'meals') {
      //     Navigator.of(context).pop();
      //     Navigator.of(context).pushReplacement(
      //       MaterialPageRoute(
      //         builder: (context) => const TabsScreen(),
      //       ),
      //     );
      //   }
      // }),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({
            Filter.glutenFree: _glutenFreeFilterText,
            Filter.lactoseFree: _lactoseFreeFilterText,
            Filter.veganFree: _veganFreeFilterText,
            Filter.vegeterianFree: _vegeterianFreeFilterText,
          });
          return false;
        },
        child: Column(
          children: [
            SwitchListTile(
              value: _glutenFreeFilterText,
              onChanged: (isChecked) {
                setState(() {
                  _glutenFreeFilterText = isChecked;
                });
              },
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
              title: Text(
                'Glutten-Free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text('Only Include Glutten-Free Meals',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground)),
            ),
            SwitchListTile(
              value: _lactoseFreeFilterText,
              onChanged: (isChecked) {
                setState(() {
                  _lactoseFreeFilterText = isChecked;
                });
              },
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
              title: Text(
                'Lactose-Free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text('Only Include Lactose-Free Meals',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground)),
            ),
            SwitchListTile(
              value: _veganFreeFilterText,
              onChanged: (isChecked) {
                setState(() {
                  _veganFreeFilterText = isChecked;
                });
              },
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
              title: Text(
                'Vegan-Free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text('Only Include Vegan-Free Meals',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground)),
            ),
            SwitchListTile(
              value: _vegeterianFreeFilterText,
              onChanged: (isChecked) {
                setState(() {
                  _vegeterianFreeFilterText = isChecked;
                });
              },
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
              title: Text(
                'Vegeterian-Free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text('Only Include Vegeterian-Free Meals',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground)),
            ),
          ],
        ),
      ),
    );
  }
}
