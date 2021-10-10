import 'package:flutter/material.dart';
import 'package:plant_shop/module/product_provider.dart';
//import 'package:plant_shop/widget/bottom_navbar.dart';
import 'package:plant_shop/widget/product_item.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatefulWidget {
  static const routName = '/favorite-screen';

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<ProductProvider>(context);
    final favorites = products.favoriteItems;
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(top: 50, left: 10),
            child: Text(
              'Favorites',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.grey),
            ),
          ),
          products.favoriteItems.isEmpty
              ? Padding(
                  padding: const EdgeInsets.only(top: 200),
                  child: Text('No Item(s) Added'),
                )
              : GridView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.all(10),
                  itemCount: favorites.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.8,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
                    value: favorites[i],
                    child: ProductItem(),
                  ),
                ),
        ],
      ),
    );
  }
}
