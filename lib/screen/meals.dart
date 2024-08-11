import 'package:flutter/material.dart';
import 'package:meals_app/model/meal.dart';
import 'package:meals_app/screen/detail_screen.dart';
import 'package:meals_app/widget/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    this.title,
    required this.meals,
  });
  final String? title;
  final List<Meal> meals;

  void selectMeal(BuildContext context,Meal meal)
  {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context)=>
          DetailScreen(meal: meal,),
      ),
    );
  }

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
        itemBuilder: ((context, index) => MealItem(meal: meals[index],onSelectMeal: (context, meal) {
          selectMeal(context, meal);
        },)),
      );
    }
    if(title == null)
    {
      return contant;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: contant,
    );
  }
}
