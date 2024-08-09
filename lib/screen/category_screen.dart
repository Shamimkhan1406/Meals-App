import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/widget/category_grid_item.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pick your category"),
      ),
      body: GridView(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3/2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          //availableCategories.map((e) => CategoryGridItem(category: e)).toList(),
          for(final category in availableCategories)
          CategoryGridItem(category: category),
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
    );
  }
}