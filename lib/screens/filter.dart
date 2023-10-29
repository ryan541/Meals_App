// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:navigator_setup/providers/filters_provider.dart';
// import 'package:navigator_setup/screens/tabs.dart';
// import 'package:navigator_setup/widgets/main_drawer.dart';

// // enum Filter {
// //   glutenFree,
// //   lactoseFree,
// //   veganFree,
// //   vegeterianFree,
// // }

// class FilterScreen extends ConsumerStatefulWidget {
//   const FilterScreen({
//     super.key,
//     //required this.currentFilters
//   });
//   //final Map<Filter, bool> currentFilters;

//   @override
//   ConsumerState<FilterScreen> createState() => _FilterScreenState();
// }

// class _FilterScreenState extends ConsumerState<FilterScreen> {
//   var _glutenFreeFilterText = false;
//   var _lactoseFreeFilterText = false;
//   var _veganFreeFilterText = false;
//   var _vegeterianFreeFilterText = false;

//   @override
//   void initState() {
//     super.initState();
//     final activeFilters = ref.read(filtersProvider);
//     _glutenFreeFilterText = activeFilters[Filter.glutenFree]!;
//     _lactoseFreeFilterText = activeFilters[Filter.lactoseFree]!;
//     _veganFreeFilterText = activeFilters[Filter.veganFree]!;
//     _vegeterianFreeFilterText = activeFilters[Filter.vegeterianFree]!;
//     // _glutenFreeFilterText = widget.currentFilters[Filter.glutenFree]!;
//     // _lactoseFreeFilterText = widget.currentFilters[Filter.lactoseFree]!;
//     // _veganFreeFilterText = widget.currentFilters[Filter.veganFree]!;
//     // _vegeterianFreeFilterText = widget.currentFilters[Filter.vegeterianFree]!;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Your Filters'),
//       ),
//       // drawer: MainDrawer(onSelectedScreen: (identifier) {
//       //   if (identifier == 'meals') {
//       //     Navigator.of(context).pop();
//       //     Navigator.of(context).pushReplacement(
//       //       MaterialPageRoute(
//       //         builder: (context) => const TabsScreen(),
//       //       ),
//       //     );
//       //   }
//       // }),
//       body: WillPopScope(
//         onWillPop: () async {
//           ref.read(filtersProvider.notifier).setFilters({
//             Filter.glutenFree: _glutenFreeFilterText,
//             Filter.lactoseFree: _lactoseFreeFilterText,
//             Filter.veganFree: _veganFreeFilterText,
//             Filter.vegeterianFree: _vegeterianFreeFilterText,
//           });
//           //Navigator.of(context).pop();
//           return true;
//         },
//         child: Column(
//           children: [
//             SwitchListTile(
//               value: _glutenFreeFilterText,
//               onChanged: (isChecked) {
//                 setState(() {
//                   _glutenFreeFilterText = isChecked;
//                 });
//               },
//               activeColor: Theme.of(context).colorScheme.tertiary,
//               contentPadding: const EdgeInsets.only(left: 34, right: 22),
//               title: Text(
//                 'Glutten-Free',
//                 style: Theme.of(context).textTheme.titleLarge!.copyWith(
//                     color: Theme.of(context).colorScheme.onBackground),
//               ),
//               subtitle: Text('Only Include Glutten-Free Meals',
//                   style: Theme.of(context).textTheme.labelMedium!.copyWith(
//                       color: Theme.of(context).colorScheme.onBackground)),
//             ),
//             SwitchListTile(
//               value: _lactoseFreeFilterText,
//               onChanged: (isChecked) {
//                 setState(() {
//                   _lactoseFreeFilterText = isChecked;
//                 });
//               },
//               activeColor: Theme.of(context).colorScheme.tertiary,
//               contentPadding: const EdgeInsets.only(left: 34, right: 22),
//               title: Text(
//                 'Lactose-Free',
//                 style: Theme.of(context).textTheme.titleLarge!.copyWith(
//                     color: Theme.of(context).colorScheme.onBackground),
//               ),
//               subtitle: Text('Only Include Lactose-Free Meals',
//                   style: Theme.of(context).textTheme.labelMedium!.copyWith(
//                       color: Theme.of(context).colorScheme.onBackground)),
//             ),
//             SwitchListTile(
//               value: _veganFreeFilterText,
//               onChanged: (isChecked) {
//                 setState(() {
//                   _veganFreeFilterText = isChecked;
//                 });
//               },
//               activeColor: Theme.of(context).colorScheme.tertiary,
//               contentPadding: const EdgeInsets.only(left: 34, right: 22),
//               title: Text(
//                 'Vegan-Free',
//                 style: Theme.of(context).textTheme.titleLarge!.copyWith(
//                     color: Theme.of(context).colorScheme.onBackground),
//               ),
//               subtitle: Text('Only Include Vegan-Free Meals',
//                   style: Theme.of(context).textTheme.labelMedium!.copyWith(
//                       color: Theme.of(context).colorScheme.onBackground)),
//             ),
//             SwitchListTile(
//               value: _vegeterianFreeFilterText,
//               onChanged: (isChecked) {
//                 setState(() {
//                   _vegeterianFreeFilterText = isChecked;
//                 });
//               },
//               activeColor: Theme.of(context).colorScheme.tertiary,
//               contentPadding: const EdgeInsets.only(left: 34, right: 22),
//               title: Text(
//                 'Vegeterian-Free',
//                 style: Theme.of(context).textTheme.titleLarge!.copyWith(
//                     color: Theme.of(context).colorScheme.onBackground),
//               ),
//               subtitle: Text('Only Include Vegeterian-Free Meals',
//                   style: Theme.of(context).textTheme.labelMedium!.copyWith(
//                       color: Theme.of(context).colorScheme.onBackground)),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:navigator_setup/providers/filters_provider.dart';
import 'package:navigator_setup/screens/tabs.dart';
import 'package:navigator_setup/widgets/main_drawer.dart';

class FilterScreen extends ConsumerWidget {
  const FilterScreen({
    super.key,
    //required this.currentFilters
  });
  //final Map<Filter, bool> currentFilters;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body: Column(
        children: [
          SwitchListTile(
            value: activeFilters[Filter.glutenFree]!,
            onChanged: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.glutenFree, isChecked);
            },
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
            title: Text(
              'Glutten-Free',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text('Only Include Glutten-Free Meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground)),
          ),
          SwitchListTile(
            value: activeFilters[Filter.lactoseFree]!,
            onChanged: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.lactoseFree, isChecked);
            },
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
            title: Text(
              'Lactose-Free',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text('Only Include Lactose-Free Meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground)),
          ),
          SwitchListTile(
            value: activeFilters[Filter.veganFree]!,
            onChanged: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.veganFree, isChecked);
            },
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
            title: Text(
              'Vegan-Free',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text('Only Include Vegan-Free Meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground)),
          ),
          SwitchListTile(
            value: activeFilters[Filter.vegeterianFree]!,
            onChanged: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.vegeterianFree, isChecked);
            },
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
            title: Text(
              'Vegeterian-Free',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text('Only Include Vegeterian-Free Meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground)),
          ),
        ],
      ),
    );
  }
}
