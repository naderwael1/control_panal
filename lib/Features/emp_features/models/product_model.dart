import 'package:flutter/material.dart';

class EmployeeModel {
  final int id;
  final String title;
 // final int price;
  final String description;
  final String category;
  final String image;

  EmployeeModel({
    required this.id,
    required this.title,
   // required this.price,
    required this.image,
    required this.description,
    required this.category,
  });

  // Factory constructor to create an EmployeeModel from a JSON object
  factory EmployeeModel.fromJson(jsonData) {
    return EmployeeModel(
      id: jsonData['id'] ,
      title: jsonData['title'] ,
      //price: jsonData['price'] ,
      image: jsonData['image'] ,
      description: jsonData['description'],
      category: jsonData['category'] ,
    );
  }

// You can add other factory constructors or methods as needed
}

class RatingModel {
  double? rate;
  int? count;

  RatingModel({this.rate, this.count});

  RatingModel.fromJson(Map<String, dynamic> json) {
    rate = json['rate'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rate'] = this.rate;
    data['count'] = this.count;
    return data;
  }
}
