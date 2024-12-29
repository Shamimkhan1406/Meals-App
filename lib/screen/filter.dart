import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/filters_provider.dart';
// import 'package:meals_app/screen/tabs.dart';
// import 'package:meals_app/widget/main_drawer.dart';

// enum Filter{
//   glutenFree,
//   lactoseFree,
//   vegetarian,
//   vegan,
// }

class FilterScreen extends ConsumerWidget {
  const FilterScreen({
    super.key,
    //required this.currentFilters,
  });
  //final Map<Filter, bool> currentFilters;

//   @override
//   ConsumerState<FilterScreen> createState() => _FilterScreenState();
// }

// class _FilterScreenState extends ConsumerState<FilterScreen> {
//   var _glutenFreeFilterSet = false;
//   var _lactoseFreeFilterSet = false;
//   var _vegetarianFilterSet = false;
//   var _veganFilterSet = false;
  // @override
  // void initState() {

  //   super.initState();
  //   final activeFilter = ref.read(filterProvider);
  //   _glutenFreeFilterSet = activeFilter[Filter.glutenFree]!;
  //   _lactoseFreeFilterSet = activeFilter[Filter.lactoseFree]!;
  //   _vegetarianFilterSet = activeFilter[Filter.vegetarian]!;
  //   _veganFilterSet = activeFilter[Filter.vegan]!;
  //   // _glutenFreeFilterSet = widget.currentFilters[Filter.glutenFree]!;
  //   // _lactoseFreeFilterSet = widget.currentFilters[Filter.lactoseFree]!;
  //   // _vegetarianFilterSet = widget.currentFilters[Filter.vegetarian]!;
  //   // _veganFilterSet = widget.currentFilters[Filter.vegan]!;
  // }
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filterProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filter Screen'),
      ),
      // drawer: MainDrawer(
      //   onSelectScreen: ((identifier) {
      //     Navigator.of(context).pop();
      //     if (identifier == 'meals') {
      //       Navigator.of(context).pushReplacement(
      //         MaterialPageRoute(
      //           builder: (context) => const TabsScreen(),
      //         ),
      //       );
      //     }
      //   }),
      // ),
      // body: PopScope(
      //   canPop: true,
      //   onPopInvoked: (didPop){
      //     if(didPop){
      //       ref.read(filterProvider.notifier).setFilters(
      //         {
      //           Filter.glutenFree: _glutenFreeFilterSet,
      //           Filter.lactoseFree: _lactoseFreeFilterSet,
      //           Filter.vegetarian: _vegetarianFilterSet,
      //          Filter.vegan: _veganFilterSet,
      //        }
      //       );
      //     }
      //     // Navigator.of(context).pop(
      //     //   {
      //     //     Filter.glutenFree: _glutenFreeFilterSet,
      //     //     Filter.lactoseFree: _lactoseFreeFilterSet,
      //     //     Filter.vegetarian: _vegetarianFilterSet,
      //     //     Filter.vegan: _veganFilterSet,
      //     //   }
      //     // );
      //   },
      //   child:
      body: Column(
        children: [
          SwitchListTile(
            value: activeFilters[Filter.glutenFree]!,
            //value: _glutenFreeFilterSet,
            onChanged: (isChacked) {
              ref.read(filterProvider.notifier).setFilter(Filter.glutenFree, isChacked);
              // setState(() {
              //   _glutenFreeFilterSet = isChacked;
              // });
            },
            title: Text(
              'Gluten-Free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              'only include gluten-free meals',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: activeFilters[Filter.lactoseFree]!,
            //value: _lactoseFreeFilterSet,
            onChanged: (isChacked) {
              ref.read(filterProvider.notifier).setFilter(Filter.lactoseFree, isChacked);
              // setState(() {
              //   _lactoseFreeFilterSet = isChacked;
              // });
            },
            title: Text(
              'Lactose-Free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              'only include lactose-free meals',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: activeFilters[Filter.vegetarian]!,
            //value: _vegetarianFilterSet,
            onChanged: (isChacked) {
              ref.read(filterProvider.notifier).setFilter(Filter.vegetarian, isChacked);
              // setState(() {
              //   _vegetarianFilterSet = isChacked;
              // });
            },
            title: Text(
              'Vegetarian',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              'only include vegetarian meals',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: activeFilters[Filter.vegan]!,
            //value: _veganFilterSet,
            onChanged: (isChacked) {
              ref.read(filterProvider.notifier).setFilter(Filter.vegan, isChacked);
              // setState(() {
              //   _veganFilterSet = isChacked;
              // });
            },
            title: Text(
              'Vegan',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              'only include vegan meals',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
        ],
      ),
    );
  }
}
