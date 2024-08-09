import 'package:flutter/material.dart';
import 'package:meals_app/model/meal.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    required this.title,
    required this.meals,
  });
  final String title;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    Widget contant = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "oh ho... Nothing here!",
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            Text(
              'Try selecting a diffrent category.',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
          ],
        ),
      );
    
    if (meals.isNotEmpty) {
      contant = ListView.builder(
        itemCount: meals.length,
        itemBuilder: ((context, index) => Text(meals[index].title)),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: contant,
    );
  }
}
