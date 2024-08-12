import 'package:flutter/material.dart';
import 'package:meals_app/model/meal.dart';
import 'package:meals_app/screen/category_screen.dart';
import 'package:meals_app/screen/meals.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;
  final List<Meal> _favoritesMeals = [];
  void _toggleMealFavoriteStatus(Meal meal)
  {
    final isExsisting = _favoritesMeals.contains(meal);
    if(isExsisting)
    {
      _favoritesMeals.remove(meal);
    }
    else
    {
      _favoritesMeals.add(meal);
    }
  }
  void _selectPage(int index)
  {
    setState(() {
      _selectedPageIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    Widget activeScreen = CategoryScreen(onToggleFavorite: _toggleMealFavoriteStatus,);
    var activePageTitle = 'Categories';
    if(_selectedPageIndex == 1)
    {
      activeScreen = MealsScreen(meals: _favoritesMeals,onToggleFavorite: _toggleMealFavoriteStatus,);
      activePageTitle = 'Your Favorites';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      body: activeScreen,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: const[
          BottomNavigationBarItem(icon: Icon(Icons.set_meal,),label: 'categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star,),label: 'favorites'),
        ]
      ),
    );
  }
}