import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../Services/Networking.dart';
import 'CartPage.dart';
import '../Services/authentication.dart';
import 'LoginPage.dart';
import 'dart:core';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatefulWidget {
  static String id = '/HomePage';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  User user = FirebaseAuth.instance.currentUser;
  Networking networking = Networking();
  var data;
  String brandName;
  String volume;
  String desc;
  int price;
  String userName;
  String photoURL;
  String defaultUrl =
      'https://thumbs.dreamstime.com/b/default-avatar-profile-icon-social-media-user-vector-default-avatar-profile-icon-social-media-user-vector-portrait-176194876.jpg';
  List<GridViewItems> items = [];

  void updateUI() async {
    data = await networking.getData();
    setState(() {
      for (var u in data) {
        GridViewItems gridViewItem = GridViewItems(
          imagePath: u['imgURL'],
          volume: u['volume'],
          price: u['price'],
          desc: u['desc'],
          brandName: u['brand'],
        );
        items.add(gridViewItem);
        userName = user.displayName;
        photoURL = user.photoURL;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    updateUI();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Container(
        width: 250,
        child: Drawer(
          child: ListView(
            children: <Widget>[
              Container(
                height: 150,
                child: DrawerHeader(
                  child: Container(
                    child: Column(
                      children: [
                        Expanded(
                          child: Align(
                            alignment: Alignment.center,
                            child: Container(
                              height: 50.0,
                              width: 50,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                    photoURL != null
                                        ? '$photoURL'
                                        : defaultUrl,
                                  ),
                                  fit: BoxFit.fill,
                                ),
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.white30,
                                  width: 2,
                                  style: BorderStyle.solid,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            userName != null
                                ? '${userName.toString()}'
                                : 'Welcome!!',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xFF2766A9),
                  ),
                ),
              ),
              Container(
                height: 550,
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: FlatButton(
                    child: Row(
                      children: [
                        Text('LogOut :',style: TextStyle(fontSize: 20)),
                        SizedBox(width: 18,),
                        Icon(Icons.logout,color: Color(0xFF2766A9),),
                      ],
                    ),
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onPressed: () => signOutUser().then((value) {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) => new LoginPage()),
                              (Route<dynamic> route) => false);
                    }),
                  ),
                ),
              ),
            ],
          ),
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
                children: items.toList(),
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
            hintText: 'Search for Brands, Type of Milk Etc...',
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
  GridViewItems(
      {this.imagePath,
        this.brandName,
        this.volume,
        this.desc,
        this.price,
        this.onBuild});
  final String imagePath;
  final String brandName;
  final String volume;
  final String desc;
  final int price;
  final Function onBuild;
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
              child: Image.network(
                imagePath,
                height: 120,
                width: 120,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
            child: Text(
              '$brandName',
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
                    infoText: 'Packaged',
                  ),
                  BorderedInfoPill(
                    infoText: '$desc',
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                top: 30,
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
                          '$price',
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
                          'BUY',
                          style: (TextStyle(color: Colors.white)),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CartPage(
                                imagePath: imagePath,
                                volume: volume,
                                brandName: brandName,
                                price: price,
                                desc: desc,
                              ),
                            ),
                          );
                        },
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
                  color: (infoText == 'organic' ? Colors.green : Colors.black),
                  width: (infoText == 'organic' ? 2.5 : 1),
                  style: BorderStyle.solid)),
          child: Text(
            (infoText == 'organic' ? 'Organic' : infoText),
            style: TextStyle(
              color: (infoText == 'organic' ? Colors.green : Colors.black),
              fontSize: 10,
              fontWeight:
              (infoText == 'organic' ? FontWeight.bold : FontWeight.normal),
            ),
          ),
        ),
      ),
    );
  }
}

