import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/model/meal.dart';
import 'package:meals_app/screen/meals.dart';
import 'package:meals_app/widget/category_grid_item.dart';
import 'package:meals_app/model/category.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({
    super.key,
    //required this.onToggleFavorite,
    required this.availableMeals,
  });
  //final void Function(Meal meal) onToggleFavorite;
  final List<Meal> availableMeals;

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      lowerBound: 0,
      upperBound: 1,

    );
    super.initState();
    _animationController.forward();
  }
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = widget.availableMeals
        .where((element) => element.categories.contains(category.id))
        .toList();
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => MealsScreen(
              title: category.title,
              meals: filteredMeals,
              //onToggleFavorite: onToggleFavorite,
            )));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(animation: _animationController, 
    child: GridView(
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
    ),
    builder: (context, child) => Padding(padding: EdgeInsets.only(top:100 - _animationController.value * 100), child: child,),
    );
  }
}
