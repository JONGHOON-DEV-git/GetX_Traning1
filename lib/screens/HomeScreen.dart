import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:getx_list_practice/state/product.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final Products _p = Get.put(Products());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GetX Practice Code '),
      ),
      body: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          const SizedBox(
            height: 20,
          ),
          InkWell(
            child: Container(
              width: 30,
              height: 80,
              color: Colors.red,
              alignment: Alignment.center,
              child: Obx(() => Text('WishList : ${_p.wishListItems.length}')),
            ),
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => Container())),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
              child: ListView.builder(
            itemCount: _p.items.length,
            itemBuilder: (context, index) {
              final product = _p.items[index];
              return Card(
                  key: ValueKey(product.id),
                  margin:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: ListTile(
                    title: Text(product.name),
                    subtitle: Text("\$${product.price.toStringAsFixed(2)}"),
                    trailing: Obx(
                      () => IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.favorite,
                            color: product.inWhshList.value
                                ? Colors.red
                                : Colors.white,
                          )),
                    ),
                  ));
            },
          ))
        ],
      ),
    );
  }
}
