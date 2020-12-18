import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  CartPage({
    this.imagePath,
    this.volume,
    this.price,
    this.desc,
    this.brandName,
  });
  static String id = '/CartPage';
  final String imagePath;
  final String volume;
  final int price;
  final String desc;
  final String brandName;
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('ShoppingCart'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Image.network(widget.imagePath),
            title: Text(widget.brandName.toString()),
            subtitle: Text(widget.desc.toString()),
            trailing: Text('${widget.price.toString()}'),
          )
        ],
      ),
    );
  }
}
