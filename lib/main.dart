import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:plant_shop/module/product_provider.dart';
import 'package:plant_shop/screens/favorite_screen.dart';
import 'package:plant_shop/screens/product_details.dart';
import 'package:plant_shop/widget/bottom_navbar.dart';
import 'package:plant_shop/widget/product_grid.dart';
import 'package:provider/provider.dart';
import './screens/tab_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => ProductProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Plant Shop',
        theme: ThemeData(
          fontFamily: 'Poppins',
          textTheme: TextTheme(),
          primarySwatch: Colors.amber,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(),
        routes: {
          ProductDetails.routeName: (ctx) => ProductDetails(),
          MyHomePage.routName: (ctx) => MyHomePage(),
          FavoriteScreen.routName: (ctx) => FavoriteScreen()
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  static const routName = '/home';
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _expanded = false;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.menu),
                      onPressed: () {},
                    ),
                    Icon(Icons.notifications),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Form(
                child: Container(
                  margin: EdgeInsets.only(left: 15, right: 15),
                  decoration: BoxDecoration(
                    border: Border.all(
                        style: BorderStyle.solid, color: Colors.grey[300]),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      enabledBorder: null,
                      prefixIcon: Icon(
                        Icons.search,
                        size: 35,
                        color: Colors.black,
                      ),
                      hintText: 'search plants....',
                      hintStyle: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                margin: EdgeInsets.only(left: 15, right: 10),
                child: Row(
                  children: <Widget>[
                    Text(
                      'Recommended',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    IconButton(
                      icon: Icon(
                          _expanded ? Icons.expand_less : Icons.expand_more),
                      onPressed: () {
                        setState(() {
                          _expanded = !_expanded;
                        });
                      },
                    ),
                  ],
                ),
              ),
              ProductGrid(),
              TabBarProducts(),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.only(left: 15),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Recently viewed',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
              ProductGrid()
            ],
          ),
        ),
        bottomNavigationBar: BottomBar(),
      ),
    );
  }
}
