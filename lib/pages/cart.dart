import 'package:flutter/material.dart';

//self imports
import 'package:mokshya/components/cart_products.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        title: Center(
          child: Text('Cart'),
        ),
        actions: [
          new IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: Cart_Products(),
      bottomNavigationBar: Container(
          color: Colors.white,
          child: Row(
            children: [
              Expanded(
                child: ListTile(
                  title: Text("Total Amount"),
                  subtitle: Text(" 230"),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  onPressed: () {},
                  child: Text(
                    "Checkout",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.deepPurple,
                ),
              )
            ],
          )),
    );
  }
}
