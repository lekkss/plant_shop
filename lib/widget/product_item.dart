import 'package:flutter/material.dart';
import 'package:plant_shop/module/product.dart';
import 'package:plant_shop/screens/product_details.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 4),
        color: Color(0xffecf8f4),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context)
                .pushNamed(ProductDetails.routeName, arguments: product.id);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Consumer<Product>(
                builder: (ctx, product, _) => Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 4),
                    child: Container(
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          product.toggleFavoriteStatus();
                        },
                        child: Icon(
                            product.isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color:
                                product.isFavorite ? Colors.red : Colors.black),
                      ),
                    ),
                  ),
                ),
              ),
              Image.asset(
                product.imageUrl,
                fit: BoxFit.cover,
                width: 120,
                height: 120,
              ),
              Text(product.title),
              Text(
                '\$${product.price}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
