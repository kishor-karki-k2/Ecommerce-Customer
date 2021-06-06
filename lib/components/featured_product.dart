import 'package:flutter/material.dart';
import 'package:mokshya/pages/feature_products_details.dart';

class FeaturedProduct extends StatefulWidget {
  @override
  _FeaturedProductState createState() => _FeaturedProductState();
}

class _FeaturedProductState extends State<FeaturedProduct> {

  var feature_products_list = [
    {
      "name": "cc camera",
      "picture": "images/featured_products/cam.jpg",
      "description": "This is Survillance Camera.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      "price": 5000,
      "quantity": 10,
      "manufacturer":"HKVISION"
    },
    {
      "name": "Cakes",
      "picture": "images/featured_products/jdcake.png",
      "description": "This is Cake.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      "price": 1800,
      "quantity": 10,
      "manufacturer":"Happy Cakes"
    },
    {
      "name": "wire",
      "picture": "images/featured_products/wire.jpg",
      "description": "This is wire.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      "price": 500,
      "quantity": 10,
      "manufacturer":"HKVISION"
    },
    {
      "name": "Network Keyboard1",
      "picture": "images/featured_products/ntwork_keyboard.jpg",
      "description": "This is Network Keyboard.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      "price": 5000,
      "quantity": 10,
      "manufacturer":"HKVISION"
    },
    {
      "name": "Attendence Device1",
      "picture": "images/featured_products/fingerprint.png",
      "description": "This is Attendance Device.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      "price": 5000,
      "quantity": 10,
      "manufacturer":"ZKTECO"
    },
    {
      "name": "monitor",
      "picture": "images/featured_products/barcodemonitor.png",
      "description": "This is monitor.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      "price": 5000,
      "quantity": 10,
      "manufacturer":"ZKTECO"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: feature_products_list.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemBuilder: (BuildContext context, int index) {
        return Feature_Single_product(
          feature_product_name: feature_products_list[index]['name'],
          feature_product_picture: feature_products_list[index]['picture'],
          feature_product_description: feature_products_list[index]['description'],
          feature_product_price: feature_products_list[index]['price'],
          feature_product_quantity: feature_products_list[index]['quantity'],
          feature_product_manufacturer: feature_products_list[index]['manufacturer'],
        );
      },
    );
  }
}

class Feature_Single_product extends StatelessWidget {
  final feature_product_name;
  final feature_product_picture;
  final feature_product_description;
  final feature_product_price;
  final feature_product_quantity;
  final feature_product_manufacturer;

  Feature_Single_product(
      {this.feature_product_name,
        this.feature_product_description,
        this.feature_product_picture,
        this.feature_product_price,
        this.feature_product_quantity,
        this.feature_product_manufacturer
      });

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.deepPurple.shade100,
      child: Hero(
        tag: feature_product_name,
        child: Material(
          child: InkWell(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                //passing the value of product from product.dart to product_details page
                builder: (context) => FeatureProductDetails(
                    feature_product_details_name: feature_product_name,
                    feature_product_details_picture: feature_product_picture,
                    feature_product_details_price: feature_product_price,
                    feature_product_details_quantity: feature_product_quantity,
                    feature_product_details_description: feature_product_description,
                    feature_product_details_manufacturer:feature_product_manufacturer
                ),
              ),
            ),
            child: GridTile(
              child: Image(
                image: AssetImage(feature_product_picture),
              ),
              footer: Container(
                height: 50.0,
                color: Colors.white70,
                child: ListTile(
                  leading: Text(
                    feature_product_name,
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
