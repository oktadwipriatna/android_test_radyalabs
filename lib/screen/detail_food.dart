import 'package:android_test_radyalabs/model/food.dart';
import 'package:flutter/material.dart';

class DetailFoodScreen extends StatelessWidget {
  const DetailFoodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final listFood = ModalRoute.of(context)!.settings.arguments as FoodList;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Food Detail'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          CircleAvatar(
            radius: 80, // Image radius
            backgroundImage: NetworkImage(listFood.image),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(0, 16, 0, 8),
            child: Text(
              listFood.name,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
            child: const Text(
              "How To :",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Text(
            listFood.desc,
          ),
        ],
      ),
    );
  }
}
