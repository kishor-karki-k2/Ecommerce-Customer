import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Cart_Products extends StatefulWidget {
  @override
  _Cart_ProductsState createState() => _Cart_ProductsState();
}

class _Cart_ProductsState extends State<Cart_Products> {
  var product_on_the_cart=[
    {
      "name": "Surviliance camera",
      "picture": "images/products/camera.jpg",
      "price": 5000,
      "quantity": 10,
    },
    {
      "name": "Cake",
      "picture": "images/products/cake.png",
      "price": 1800,
      "quantity": 10,
    },
    {
      "name": "Attendence Device",
      "picture": "images/products/attendence_device.jpg",
      "price": 5000,
      "quantity": 10,
    },

  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount:product_on_the_cart.length ,
      itemBuilder: (context,index){
      return Single_cart_product(
        cart_product_name: product_on_the_cart[index]['name'],
        cart_product_picture: product_on_the_cart[index]['picture'],
        cart_product_price: product_on_the_cart[index]['price'],
        cart_product_quantity: product_on_the_cart[index]['quantity'],
      );
    },
    );
  }
}
class Single_cart_product extends StatelessWidget {
  final cart_product_name;
  final cart_product_picture;
  final cart_product_price;
  final cart_product_quantity;

  Single_cart_product({
    this.cart_product_name,
    this.cart_product_picture,
    this.cart_product_price,
    this.cart_product_quantity

  });
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Card(
      child: Row(
        children: [
          SizedBox(
            width: (screenSize.width / 5) * 4.3,
            child: ListTile(
              //leading section
              leading: Image.asset(cart_product_picture,width: 80.0,height: 80.0,),
              title: Text(cart_product_name),
              //title section
              subtitle: Column(
                children: [
                  //row inside column
                  Row(
                    children: [
                      //this section is for the price of product
                      Padding(
                        padding: EdgeInsets.all(0.0),
                        child: Text("Price:"),
                      ),
                      Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Text('Rs.${cart_product_price}',
                        style: TextStyle(
                          color: Colors.redAccent
                        ),),
                      ),
                      //this secction is for quantity
                      Padding(
                        padding: EdgeInsets.fromLTRB(20.0, 8.0, 8.0, 8.0),
                        child: Text("Quantity"),
                      ),
                      Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Text('${cart_product_quantity}',
                        style: TextStyle(
                          color: Colors.redAccent
                        ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
           SizedBox(
              width: 49.0,
                child: new Column(
                  children: <Widget>[
                    new IconButton(icon: Icon(Icons.arrow_drop_up), onPressed: () {}),
                    new Text("$cart_product_quantity"),
                    new IconButton(icon: Icon(Icons.arrow_drop_down), onPressed: () {})
                  ],
                ),
              )
        ],
      ),
    );
  }
}

