import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'authentication.dart';
import 'LoginPage.dart';

class HomePage extends StatefulWidget {
  static String id = '/HomePage';
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
            IconButton(
              icon: Icon(Icons.exit_to_app),
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onPressed: () => signOutUser().then((value) {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => LoginPage()),
                    (Route<dynamic> route) => false);
              }),
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
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 16, bottom: 5, right: 16, left: 16),
            child: Center(
              child: Image.asset(
                imagePath,
                height: 120,
                width: 120,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
            child: Text(
              'Amul',
              style: TextStyle(fontFamily: 'Russo'),
            ),
          ),
          Container(
            child: Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  BorderedInfoPill(
                    infoText: '1L',
                  ),
                  BorderedInfoPill(
                    infoText: 'Whole Milk',
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                top: 30,
                bottom: 20,
              ),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Text(
                          '₹',
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'Alfa',
                            color: Colors.green,
                          ),
                        ),
                        Text(
                          '70',
                          style: TextStyle(
                            fontFamily: 'Alfa',
                            color: Colors.green,
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(right: 16.0),
                      child: RawMaterialButton(
                        child: Text(
                          'ADD',
                          style: (TextStyle(color: Colors.white)),
                        ),
                        onPressed: () {},
                        fillColor: Color(0xFF2766A9),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                        constraints: BoxConstraints.tightFor(
                          width: 80,
                          height: 30,
                        ),
                      ),
                    ),
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

class BorderedInfoPill extends StatelessWidget {
  BorderedInfoPill({this.infoText});
  final String infoText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 1.0),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: 30,
          maxWidth: 60,
          minHeight: 10,
          maxHeight: 20,
        ),
        child: FlatButton(
          onPressed: () {},
          padding: EdgeInsets.all(2),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
              side: BorderSide(
                color: Colors.black,
                width: 1,
                style: BorderStyle.solid,
              )),
          child: Text(
            infoText,
            style: TextStyle(
              fontSize: 10,
            ),
          ),
        ),
      ),
    );
  }
}
