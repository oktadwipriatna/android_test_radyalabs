import 'dart:convert';

List<FoodList> foodListFromJson(String str) => List<FoodList>.from(json.decode(str).map((x) => FoodList.fromJson(x)));

String foodListToJson(List<FoodList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FoodList {
  FoodList({
    required this.name,
    required this.image,
    required this.desc,
  });

  String name;
  String image;
  String desc;

  factory FoodList.fromJson(Map<String, dynamic> json) => FoodList(
    name: json["name"],
    image: json["image"],
    desc: json["desc"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "image": image,
    "desc": desc,
  };
}
