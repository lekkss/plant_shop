import 'package:flutter/material.dart';
import 'package:plant_shop/module/product_provider.dart';
import 'package:provider/provider.dart';

class ProductDetails extends StatefulWidget {
  static const routeName = '/product-details';

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int quantity = 1;

  double total;

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String;

    final loadedProducts = Provider.of<ProductProvider>(context, listen: false)
        .findById(productId);

    return Scaffold(
      backgroundColor: Color(0xffecf8f4),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height / 2,
                  color: Color(0xffecf8f4),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Row(
                          children: <Widget>[
                            FlatButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Icon(Icons.arrow_back),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 70,
                            ),
                            child: Image.asset(
                              loadedProducts.imageUrl,
                              fit: BoxFit.cover,
                              width: 200,
                              height: 250,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(right: 15),
                            child: Column(
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Icon(
                                      Icons.ac_unit,
                                      color: Color(0xffaed2b8),
                                    ),
                                    Text('2-2.5L'),
                                  ],
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Column(
                                  children: <Widget>[
                                    Icon(
                                      Icons.ac_unit,
                                      color: Color(0xffaed2b8),
                                    ),
                                    Text('27\'C'),
                                  ],
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Column(
                                  children: <Widget>[
                                    Icon(
                                      Icons.wb_sunny,
                                      color: Color(0xffaed2b8),
                                    ),
                                    Text('3 Hours'),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      topLeft: Radius.circular(10),
                    ),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              loadedProducts.title,
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xffaed2b8)),
                            ),
                            Text(
                              '\$${loadedProducts.price}',
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          loadedProducts.description,
                          style: TextStyle(
                            letterSpacing: 1,
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Quantity',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: <Widget>[
                                IconButton(
                                  icon: Icon(
                                    Icons.remove_circle_outline,
                                    color: Color(0xffaed2b8),
                                  ),
                                  onPressed: () {
                                    if (quantity <= 1) {
                                      return;
                                    } else {
                                      setState(() {
                                        quantity -= 1;
                                      });
                                    }
                                  },
                                ),
                                Text(
                                  quantity.toString(),
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                IconButton(
                                    icon: Icon(
                                      Icons.add_circle_outline,
                                      color: Color(0xffaed2b8),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        quantity += 1;
                                      });
                                    })
                              ],
                            )
                          ],
                        ),
                        Divider(),
                        SizedBox(
                          height: 2,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Total',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Text(
                                  '\$${loadedProducts.price * quantity}',
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xffaed2b8),
                                  ),
                                ),
                              ],
                            ),
                            FlatButton(
                              textColor: Colors.white,
                              color: Color(0xff75b286),
                              onPressed: () {},
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, top: 10, bottom: 10, right: 20),
                                child: Text('Add to basket'),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),

            // Container(
            //   height: 10,
            //   width: 10,
            //   color: Colors.blue,
            // ),
            Positioned(
              right: 10,
              top: 290,
              child: Align(
                //alignment: Alignment.centerRight,
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.black.withOpacity(.25),
                        blurRadius: 10,
                      ),
                    ],
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        loadedProducts.toggleFavoriteStatus();
                      });
                    },
                    icon: Icon(
                      //Icons.favorite,
                      loadedProducts.isFavorite
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color:
                          loadedProducts.isFavorite ? Colors.red : Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
