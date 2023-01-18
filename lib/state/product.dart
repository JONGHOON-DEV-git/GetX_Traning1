import 'dart:math';

import 'package:get/get.dart';
import 'package:getx_list_practice/models/item.dart';

class Products extends GetxController {
  final RxList<Item> _Items = List.generate(
      100,
      (index) => Item(
          id: index,
          name: 'Product ${index}',
          inWhshList: false.obs,
          price: Random().nextDouble() * 100)).obs;

  List<Item> get items {
    return [..._Items];
  }

  List<Item> get wishListItems {
    return _Items.where((item) => item.inWhshList == true).toList();
  }

  void addItem(int id) {
    final int index = _Items.indexWhere((item) => item.id == id);
    _Items[index].inWhshList.value = true;
  }

  void removeItem(int id) {
    final int index = _Items.indexWhere((element) => element.id == id);
    _Items[index].inWhshList.value = false;
  }
}
