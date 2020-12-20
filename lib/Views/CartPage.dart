import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'PayPage.dart';

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
  void initState() {
    items.add(CartItem(
      imgURL: widget.imagePath,
      brand: widget.brandName,
      price: widget.price,
      desc: widget.desc,
    ));
  }

  @override
  List<CartItem> items = [];
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Your Order',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 25,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          ListView(children: items),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
                padding: EdgeInsets.all(20),
                child: RawMaterialButton(
                  elevation: 20,
                  fillColor: Color(0xFF2766A9),
                  onPressed: () {
                    Navigator.pushNamed(context, PayPage.id);
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
                  constraints: BoxConstraints.tightFor(
                    height: 50,
                    width: 200,
                  ),
                  child: Text(
                    'Proceed to Checkout',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )),
          )
        ],
      ),
    );
  }
}

class CartItem extends StatefulWidget {
  CartItem({this.imgURL, this.brand, this.desc, this.price});
  final String imgURL;
  final String brand;
  final String desc;
  final int price;

  @override
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  int itemQuantity = 1;
  double volume = 500;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          ListTile(
            leading: Image.network(widget.imgURL.toString()),
            title: Text(widget.brand.toString()),
            subtitle: Text(widget.desc.toString()),
            trailing: Padding(
              padding: EdgeInsets.only(right: 30),
              child: Text(
                '₹${widget.price.toString()}/L',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: ItemButton(
                  child: Icon(Icons.remove),
                  onPressed: () {
                    setState(() {
                      if (itemQuantity > 1) {
                        itemQuantity--;
                      }
                      ;
                    });
                  },
                ),
              ),
              Text(
                itemQuantity.abs().toString(),
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: ItemButton(
                  child: Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      if (itemQuantity < 10) {
                        itemQuantity++;
                      }
                    });
                  },
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        'Volume',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Slider(
                        activeColor: Color(0xFF2766A9),
                        value: volume,
                        min: 500,
                        max: 2000,
                        divisions: 3,
                        onChanged: (sliderValue) {
                          setState(() {
                            volume = sliderValue;
                          });
                        }),
                    Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          child: Text(
                            '${volume / 1000}L',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )),
                  ],
                ),
              )
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    'Your Total:',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Expanded(
                    child: Padding(
                  padding: EdgeInsets.all(30),
                  child: Text(
                    '₹${(itemQuantity * widget.price * (volume / 1000)).toStringAsFixed(1)}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                      fontSize: 40,
                    ),
                  ),
                )),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class ItemButton extends StatelessWidget {
  ItemButton({this.onPressed, this.child});
  final Function onPressed;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: child,
      constraints: BoxConstraints.tightFor(
        width: 50,
        height: 50,
      ),
      onPressed: onPressed,
      shape: CircleBorder(
        side:
            BorderSide(color: Colors.grey, width: 1, style: BorderStyle.solid),
      ),
    );
  }
}
