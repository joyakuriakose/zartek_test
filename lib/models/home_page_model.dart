// To parse this JSON data, do
//
//     final homePageModel = homePageModelFromJson(jsonString);

import 'dart:convert';

HomePageModel homePageModelFromJson(String str) => HomePageModel.fromJson(json.decode(str));

String homePageModelToJson(HomePageModel data) => json.encode(data.toJson());

class HomePageModel {
  List<Category>? categories;

  HomePageModel({
    this.categories,
  });

  factory HomePageModel.fromJson(Map<String, dynamic> json) => HomePageModel(
    categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "categories": List<dynamic>.from(categories!.map((x) => x.toJson())),
  };
}

class Category {
  int? id;
  String? name;
  List<Dish>? dishes;

  Category({
    this.id,
    this.name,
    this.dishes,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    name: json["name"],
    dishes: List<Dish>.from(json["dishes"].map((x) => Dish.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "dishes": List<dynamic>.from(dishes!.map((x) => x.toJson())),
  };
}

class Dish {
  int? id;
  String? name;
  String? price;
  Currency? currency;
  int? calories;
  String? description;
  List<Addon>? addons;
  String? imageUrl;
  bool? customizationsAvailable;

  Dish({
    this.id,
    this.name,
    this.price,
    this.currency,
    this.calories,
    this.description,
    this.addons,
    this.imageUrl,
    this.customizationsAvailable,
  });

  factory Dish.fromJson(Map<String, dynamic> json) => Dish(
    id: json["id"],
    name: json["name"],
    price: json["price"],
    currency: currencyValues.map[json["currency"]],
    calories: json["calories"],
    description: json["description"],
    addons: List<Addon>.from(json["addons"].map((x) => Addon.fromJson(x))),
    imageUrl: json["image_url"],
    customizationsAvailable: json["customizations_available"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "price": price,
    "currency": currencyValues.reverse[currency],
    "calories": calories,
    "description": description,
    "addons": List<dynamic>.from(addons!.map((x) => x.toJson())),
    "image_url": imageUrl,
    "customizations_available": customizationsAvailable,
  };
}

class Addon {
  int? id;
  String? name;
  String? price;

  Addon({
    this.id,
    this.name,
    this.price,
  });

  factory Addon.fromJson(Map<String, dynamic> json) => Addon(
    id: json["id"],
    name: json["name"],
    price: json["price"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "price": price,
  };
}

enum Currency {
  INR
}

final currencyValues = EnumValues({
  "INR": Currency.INR
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
