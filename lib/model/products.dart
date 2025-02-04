import 'package:flutter/material.dart';

class Product {
  late String brand, name, color, size, image;
  late double price, rating;
  late bool available;
  late IconData icon;
  bool isNew = false;
  bool isSoldOut = false;
  bool isDiscount = false;
  Product(
      this.brand,
      this.name,
      this.color,
      this.size,
      this.price,
      this.rating,
      this.image,
      this.available,
      this.icon,
      this.isNew,
      this.isSoldOut,
      this.isDiscount);
}
