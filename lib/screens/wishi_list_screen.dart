import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_list_practice/state/product.dart';

class WhisiListScreen extends StatelessWidget {
  WhisiListScreen({super.key});

  final Products _p = Get.find<Products>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Obx(() => ListView.builder(
            itemBuilder: (context, index) {
              final item = _p.wishListItems[index];
              return Card(
                key: ValueKey(item.id),
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                color: Colors.blue[200],
                child: ListTile(
                  leading: CircleAvatar(
                    child: Text(item.id.toString()),
                  ),
                  title: Text(item.name),
                  subtitle: Text(item.price.toStringAsFixed(2)),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      item.inWhshList.value = false;
                      _p.removeItem(item.id);
                    },
                  ),
                ),
              );
            },
            itemCount: _p.wishListItems.length,
          )),
    );
  }
}
