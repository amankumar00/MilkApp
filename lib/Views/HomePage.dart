import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static String id = '/s';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              decoration: BoxDecoration(
                color: Color(0xFF2766A9),
              ),
            ),
            ListTile(
              title: Text('item 1'),
              onTap: () {},
            ),
            ListTile(
              title: Text('item 2'),
              onTap: () {},
            ),
            ListTile(
              title: Text('item 3'),
              onTap: () {},
            ),
          ],
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'MilkMan',
        ),
      ),
      body: Container(
        child: GridView.count(
          childAspectRatio: 0.625,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          padding: EdgeInsets.all(10),
          crossAxisCount: 2,
          children: <Widget>[
            GridViewItems(
              imagePath: 'images/AmulMilk.png',
            ),
            GridViewItems(
              imagePath: 'images/AmulMilk.png',
            ),
            GridViewItems(
              imagePath: 'images/AmulMilk.png',
            ),
            GridViewItems(
              imagePath: 'images/AmulMilk.png',
            ),
            GridViewItems(
              imagePath: 'images/AmulMilk.png',
            ),
          ],
        ),
      ),
    );
  }
}

class GridViewItems extends StatelessWidget {
  GridViewItems({this.imagePath});
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Image.asset(
            imagePath,
            height: 120,
            width: 120,
          ),
        ],
      ),
    );
  }
}
