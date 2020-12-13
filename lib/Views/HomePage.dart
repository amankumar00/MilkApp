import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static String id = '/';
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
      body: Column(
        children: [
          SearchTextField(),
          Expanded(
            child: Container(
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
          ),
        ],
      ),
    );
  }
}

class SearchTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      child: TextField(
        decoration: InputDecoration(
            hintText: 'Search for Brands, Volume, Type of Milk Etc...',
            filled: true,
            fillColor: Colors.white70,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(30.0),
              ),
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
              Radius.circular(30.0),
            ))),
        onChanged: (value) {},
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
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Image.asset(
                imagePath,
                height: 120,
                width: 120,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Expanded(
              child: Text(
                'Amul',
                style: TextStyle(fontFamily: 'Russo'),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Expanded(child: Text('1L')),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Expanded(
              child: Text(
                'Pasteurised',
                style: TextStyle(
                  fontFamily: 'Gloria',
                ),
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Expanded(
                  child: Text(
                    '₹70',
                    style: TextStyle(
                      fontFamily: 'Alfa',
                      color: Colors.green,
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
