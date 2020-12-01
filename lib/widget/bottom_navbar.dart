import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plant_shop/main.dart';
import 'package:plant_shop/screens/favorite_screen.dart';

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        padding: EdgeInsets.only(top: 5),
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.of(context).pushNamed(MyHomePage.routName);
              },
              child: Column(
                children: <Widget>[
                  Icon(
                    Icons.home,
                    color: Colors.grey,
                  ),
                  Text('Home')
                ],
              ),
            ),
            FlatButton(
              onPressed: () {
                Navigator.of(context).pushNamed(FavoriteScreen.routName);
              },
              child: Column(
                children: <Widget>[
                  Icon(
                    Icons.favorite_border,
                    color: Colors.grey,
                  ),
                  Text('Favorite')
                ],
              ),
            ),
            FlatButton(
              onPressed: () {},
              child: Column(
                children: <Widget>[
                  Icon(
                    Icons.lock_outline,
                    color: Colors.grey,
                  ),
                  Text('shop')
                ],
              ),
            ),
            FlatButton(
              onPressed: () {},
              child: Column(
                children: <Widget>[
                  Icon(
                    Icons.person_outline,
                    color: Colors.grey,
                  ),
                  Text('Profile')
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
