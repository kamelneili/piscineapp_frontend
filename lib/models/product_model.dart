import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Product extends Equatable {
  final String id;
  final String name;
  final String category;
  final String imageUrl;
  final String price;
  final String description;

  // final List<String> tags;
  final bool isRecommanded;

  Product({
    required this.id,
    required this.description,
    required this.name,
    required this.imageUrl,
    required this.category,
    required this.price,
    required this.isRecommanded,
  });
  @override
  List<Object?> get props =>
      [id, name, imageUrl, category, price, isRecommanded, description];
  static Product fromSnapshot(DocumentSnapshot snap) {
    Product product = Product(
      id: snap.id,
      name: snap['name'],
      description: snap['description'],

      category: snap['category'],
      imageUrl: snap['imageUrl'],
      price: snap['price'],
      isRecommanded: snap['isRecommanded'],
      //isPopular: snap['isPopular'],
      //description: snap['description'],
    );
    return product;
  }
  // static List<Product> products = [
  //   Product(
  //       id: 1,
  //       name: ' makeup1',
  //       imageUrl:
  //           'https://images.unsplash.com/photo-1602910344008-22f323cc1817?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
  //       deliveryFee: 2.99,
  //       priceCategory: '\$',
  //       deliveryTime: 30,
  //       distance: 0.1,
  //       tags: ['Makeup']),
  //   Product(
  //       id: 2,
  //       name: 'bridal',
  //       imageUrl:
  //           'https://images.unsplash.com/photo-1482954727730-2c843ce77718?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
  //       deliveryFee: 2.99,
  //       priceCategory: '\$',
  //       deliveryTime: 30,
  //       distance: 0.1,
  //       tags: ['Bridal']),
  //   Product(
  //       id: 3,
  //       name: ' face skin',
  //       imageUrl:
  //           'https://media.istockphoto.com/photos/cropped-shot-of-pretty-young-woman-applies-cream-for-rejuvenation-picture-id1270211699?s=612x612',
  //       deliveryFee: 2.99,
  //       priceCategory: '\$',
  //       deliveryTime: 30,
  //       distance: 0.1,
  //       tags: ['FaceSkin']),
  //   Product(
  //       id: 4,
  //       name: 'makeup',
  //       imageUrl:
  //           'https://media.istockphoto.com/photos/various-cosmetic-accessories-for-makeup-and-manicure-on-trendy-pastel-picture-id1320345717?s=612x612',
  //       deliveryFee: 2.99,
  //       priceCategory: '\$',
  //       deliveryTime: 30,
  //       distance: 0.1,
  //       tags: ['Makeup']),
  // ];
}
