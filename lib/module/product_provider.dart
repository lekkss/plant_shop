import 'package:flutter/foundation.dart';
import 'package:plant_shop/module/product.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _items = [
    Product(
        id: 'p1',
        title: 'Soap Aloe',
        description:
            'Soap aloe is a very variable spicies and hybridizes easily with other similar aloes, sometimes making it difficult to identify. The leaves range in color from red to green, but always have distinctive "H-shaped" spots',
        price: 25,
        imageUrl: 'images/flower 1.png'),
    Product(
        id: 'p2',
        title: 'Pothos',
        description:
            'Soap aloe is a very variable spicies and hybridizes easily with other similar aloes, sometimes making it difficult to identify. The leaves range in color from red to green, but always have distinctive "H-shaped" spots',
        price: 25,
        imageUrl: 'images/flower 3.png'),
    Product(
        id: 'p3',
        title: 'Dragon Tree',
        description:
            'Soap aloe is a very variable spicies and hybridizes easily with other similar aloes, sometimes making it difficult to identify. The leaves range in color from red to green, but always have distinctive "H-shaped" spots',
        price: 25,
        imageUrl: 'images/flower 2.png'),
    Product(
        id: 'p4',
        title: 'Totem Pole',
        description:
            'Soap aloe is a very variable spicies and hybridizes easily with other similar aloes, sometimes making it difficult to identify. The leaves range in color from red to green, but always have distinctive "H-shaped" spots',
        price: 25,
        imageUrl: 'images/flower 4.png'),
  ];

  List<Product> get items => _items;

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  List<Product> get favoriteItems {
    return _items.where((prodItem) => prodItem.isFavorite).toList();
  }
}
