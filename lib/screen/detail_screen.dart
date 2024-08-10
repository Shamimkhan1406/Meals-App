import 'package:flutter/material.dart';
import 'package:meals_app/model/meal.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key,required this.meal});
  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: 
        Image.network(meal.imageUrl),
      // Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     Text(meal.title,style: const TextStyle(fontSize: 30),),
      //   ],
      // ),
    );
  }
}