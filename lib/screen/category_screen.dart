import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/model/meal.dart';
import 'package:meals_app/screen/meals.dart';
import 'package:meals_app/widget/category_grid_item.dart';
import 'package:meals_app/model/category.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({
    super.key,
    required this.onToggleFavorite,
    required this.availableMeals,
  });
  final void Function(Meal meal) onToggleFavorite;
  final List<Meal> availableMeals;
  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = availableMeals
        .where((element) => element.categories.contains(category.id))
        .toList();
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => MealsScreen(
              title: category.title,
              meals: filteredMeals,
              onToggleFavorite: onToggleFavorite,
            )));
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        //availableCategories.map((e) => CategoryGridItem(category: e)).toList(),
        for (final category in availableCategories)
          CategoryGridItem(
            category: category,
            onSelectCategory: () {
              _selectCategory(context, category);
            },
          ),
      ],
      // const [
      //   Text('1',style: TextStyle(color: Colors.white),),
      //   Text('2',style: TextStyle(color: Colors.white),),
      //   Text('3',style: TextStyle(color: Colors.white),),
      //   Text('4',style: TextStyle(color: Colors.white),),
      //   Text('5',style: TextStyle(color: Colors.white),),
      //   Text('6',style: TextStyle(color: Colors.white),),
      // ],
    );
  }
}
