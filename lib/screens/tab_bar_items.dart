import 'package:flutter/material.dart';
import 'package:plant_shop/module/product_provider.dart';
import 'package:plant_shop/widget/tab_bar_list.dart';
import 'package:provider/provider.dart';

class TabBarItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<ProductProvider>(context);
    return ListView.builder(
      //padding: EdgeInsets.only(left: 5),
      scrollDirection: Axis.horizontal,
      itemCount: productsData.items.length,
      itemBuilder: (
        ctx,
        i,
      ) =>
          ChangeNotifierProvider.value(
        value: productsData.items[i],
        child: Padding(
          padding: const EdgeInsets.only(right: 10),
          child: TabBarList(),
        ),
      ),
    );
  }
}
