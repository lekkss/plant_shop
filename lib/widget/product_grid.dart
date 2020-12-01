import 'package:flutter/material.dart';
import 'package:plant_shop/module/product_provider.dart';
import 'package:plant_shop/widget/product_item.dart';
import 'package:provider/provider.dart';

class ProductGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductProvider>(context);
    return GridView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.all(10),
      itemCount: productData.items.take(2).toList().length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.8,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: productData.items[i],
        child: ProductItem(),
      ),
    );
  }
}
