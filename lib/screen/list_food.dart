import 'dart:convert';
import 'package:android_test_radyalabs/model/food.dart';
import 'package:android_test_radyalabs/screen/detail_food.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ListFoodScreen extends StatefulWidget {
  const ListFoodScreen({Key? key}) : super(key: key);

  @override
  State<ListFoodScreen> createState() => _ListFoodScreenState();
}

class _ListFoodScreenState extends State<ListFoodScreen> {
  List<FoodList> listFood = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchFood();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Food'),
        centerTitle: true,
      ),
      body: GridView.builder(
          itemCount: listFood.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3/2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10
          ),
          itemBuilder: (BuildContext ctx, index) {
            return GridTile(
                footer: GridTileBar(
                  backgroundColor: Colors.black54,
                  title: Text(
                    listFood[index].name,
                    textAlign: TextAlign.center,
                  ),
                ),
                child: InkWell(
                  child: Image.network(
                    listFood[index].image,
                    fit: BoxFit.cover,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DetailFoodScreen(),
                        settings: RouteSettings(
                          arguments: listFood[index],
                        ),
                      ),
                    );
                  },
                ),
            );
          }),
    );
  }

  void fetchFood() async {
    const url = 'https://playground-rest-api-vk3y7f3hta-et.a.run.app/foods';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    setState(() {
      var data = foodListFromJson(body);
      listFood.addAll(data);
      print("size ${listFood.length}");
    });
  }
}
