import 'package:get/get.dart';

class Item {
  int id;
  String name;
  double price;
  RxBool inWhshList;

  Item(
      {required this.id,
      required this.name,
      required this.price,
      required this.inWhshList});
}
