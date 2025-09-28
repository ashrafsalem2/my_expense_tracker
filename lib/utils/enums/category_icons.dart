import 'package:expense_tracker/utils/enums/category.dart';
import 'package:flutter/material.dart';

class CategoryIcons {
  static Map catIcon = {
    Category.food: Icon(Icons.food_bank_rounded),
    Category.breakfast: Icon(Icons.breakfast_dining),
    Category.coffe: Icon(Icons.coffee),
    Category.transportaions: Icon(Icons.bus_alert),
  };
}
