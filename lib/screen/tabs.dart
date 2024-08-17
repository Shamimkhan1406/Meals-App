import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/model/meal.dart';
import 'package:meals_app/screen/category_screen.dart';
import 'package:meals_app/screen/filter.dart';
import 'package:meals_app/screen/meals.dart';
import 'package:meals_app/widget/main_drawer.dart';

const kInitialFilters = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false,
};

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;
  final List<Meal> _favoritesMeals = [];
  Map<Filter, bool> _selectedFilters = kInitialFilters;
  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  void _toggleMealFavoriteStatus(Meal meal) {
    final isExsisting = _favoritesMeals.contains(meal);
    if (isExsisting) {
      setState(() {
        _favoritesMeals.remove(meal);
        _showInfoMessage('Meal is no longer a favorite.');
      });
      //_favoritesMeals.remove(meal);
    } else {
      setState(() {
        _favoritesMeals.add(meal);
        _showInfoMessage('Marked as favorite.');
      });
      //_favoritesMeals.add(meal);
    }
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      final result = await Navigator.of(context).push<Map<Filter, bool>>(
        //pushReplacement
        MaterialPageRoute(builder: (context) => FilterScreen(currentFilters: _selectedFilters,)),
      );
      setState(() {
        _selectedFilters = result ?? kInitialFilters;
      });
      //print(result);
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals = dummyMeals.where((meal) {
      if (_selectedFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (_selectedFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (_selectedFilters[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      if (_selectedFilters[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();
    Widget activeScreen = CategoryScreen(
      onToggleFavorite: _toggleMealFavoriteStatus,
      availableMeals: availableMeals,
    );
    var activePageTitle = 'Categories';
    if (_selectedPageIndex == 1) {
      activeScreen = MealsScreen(
        meals: _favoritesMeals,
        onToggleFavorite: _toggleMealFavoriteStatus,
      );
      activePageTitle = 'Your Favorites';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(
        onSelectScreen: _setScreen,
      ),
      body: activeScreen,
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          currentIndex: _selectedPageIndex,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.set_meal,
                ),
                label: 'categories'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.star,
                ),
                label: 'favorites'),
          ]),
    );
  }
}
