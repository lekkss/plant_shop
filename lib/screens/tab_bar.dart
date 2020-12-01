import 'package:flutter/material.dart';
import 'package:plant_shop/module/product_provider.dart';
import 'package:plant_shop/screens/tab_bar_items.dart';
import 'package:provider/provider.dart';

class TabBarProducts extends StatefulWidget {
  @override
  _TabBarProductsState createState() => _TabBarProductsState();
}

class _TabBarProductsState extends State<TabBarProducts>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<ProductProvider>(context);
    return Column(
      children: <Widget>[
        TabBar(
          //controller: _tabController,
          indicatorColor: Colors.transparent,
          unselectedLabelColor: Color(0XFFCDCDCD),
          isScrollable: true,
          tabs: <Widget>[
            Tab(
              child: Text('Synthetic'),
            ),
            Tab(
              child: Text('Ordanic'),
            ),
            Tab(
              child: Text('Indoor'),
            ),
            Tab(
              child: Text('Outdoor'),
            ),
            Tab(
              child: Text('Garden'),
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.only(left: 10),
          height: 200,
          child: TabBarView(children: <Widget>[
            TabBarItems(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('NO ITEMS ADDED'),
            ),
            Text('NO ITEMS ADDED'),
            Text('NO ITEMS ADDED'),
            Text('NO ITEMS ADDED'),
          ]),
        )
      ],
    );
  }
}
