import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mokshya/components/horizontal_listview.dart';
import 'package:mokshya/pages/product_details.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var products_list = [
    {
      "name": "Surviliance camera",
      "picture": "images/products/camera.jpg",
      "description": "This is Survillance Camera.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      "price": 5000,
      "quantity": 10,
      "manufacturer":"HKVISION"
    },
    {
      "name": "Cake",
      "picture": "images/products/cake.png",
      "description": "This is Cake.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      "price": 1800,
      "quantity": 10,
      "manufacturer":"Happy Cakes"
    },
    {
      "name": "Hard Disk",
      "picture": "images/products/Harddisk.jpg",
      "description": "This is Hard Disk.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      "price": 5000,
      "quantity": 10,
      "manufacturer":"WD PURPLE"
    },
    {
      "name": "Network Keyboard",
      "picture": "images/products/network_keyboard.jpg",
      "description": "This is Network Keyboard.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      "price": 5000,
      "quantity": 10,
      "manufacturer":"HKVISION"
    },
    {
      "name": "Attendence Device",
      "picture": "images/products/attendence_device.jpg",
      "description": "This is Attendance Device.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      "price": 5000,
      "quantity": 10,
      "manufacturer":"ZKTECO"
    },
    {
      "name": "Switch",
      "picture": "images/products/switch.jpg",
      "description": "This is switch.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      "price": 5000,
      "quantity": 10,
      "manufacturer":"HKVISION"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: products_list.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemBuilder: (BuildContext context, int index) {
        return Single_product(
          product_name: products_list[index]['name'],
          product_picture: products_list[index]['picture'],
          product_description: products_list[index]['description'],
          product_price: products_list[index]['price'],
          product_quantity: products_list[index]['quantity'],
          product_manufacturer: products_list[index]['manufacturer'],
        );
      },
    );
  }
}

class Single_product extends StatelessWidget {
  final product_name;
  final product_picture;
  final product_description;
  final product_price;
  final product_quantity;
  final product_manufacturer;

  Single_product(
      {this.product_name,
      this.product_description,
      this.product_picture,
      this.product_price,
      this.product_quantity,
      this.product_manufacturer
      });

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.deepPurple.shade100,
      child: Hero(
        tag: product_name,
        child: Material(
          child: InkWell(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                //passing the value of product from product.dart to product_details page
                  builder: (context) => ProductDetails(
                        product_details_name: product_name,
                        product_details_picture: product_picture,
                        product_details_price: product_price,
                        product_details_quantity: product_quantity,
                        product_details_description: product_description,
                        product_details_manufacturer:product_manufacturer
                      ),
              ),
            ),
            child: GridTile(
              child: Image(
                image: AssetImage(product_picture),
              ),
              footer: Container(
                color: Colors.white60,
                height: 50.0,
                child: ListTile(
                  leading: Text(
                    product_name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
