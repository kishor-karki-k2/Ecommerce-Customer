import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mokshya/main.dart';
import 'package:mokshya/pages/cart.dart';
import 'package:mokshya/pages/home.dart';

class ProductDetails extends StatefulWidget {
  final product_details_name;
  final product_details_picture;
  final product_details_price;
  final product_details_quantity;
  final product_details_description;
  final product_details_manufacturer;

  ProductDetails(
  {
    this.product_details_name,
    this.product_details_picture,
    this.product_details_price,
    this.product_details_quantity,
    this.product_details_description,
    this.product_details_manufacturer
}
      );
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        title: Center(child: InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Homepage(),),);
          },
          child: Text('Mokshya Tech'),
        ),
        ),
        actions: [
          new IconButton(icon: Icon(Icons.search),
            onPressed:(){

            },),
        ],

      ),
      body: ListView(
        children: [
          Container(
            height: 300,
            child: GridTile(
              child: Container(
                color: Colors.white60,
                child: Image(
                  image: AssetImage(widget.product_details_picture),
                ),
              ),
              footer:Container(
                color: Colors.white70,
                child: ListTile(
                  leading: Text(widget.product_details_name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0
                  ),
                  ),
                  title: Row(
                    children: [
                      Expanded(
                        child: Text("RS:${widget.product_details_price}",
                        style: TextStyle(
                          color: Colors.redAccent,
                        ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),


          //buy now
          Row(
            children: [
              Expanded(
                child: MaterialButton(
                  onPressed: (){},
                  color: Colors.deepPurple,
                  textColor: Colors.white,
                  elevation: 0.2,
                  child: Text('Buy Now'),
                ),
              ),
              IconButton(icon: Icon(Icons.shopping_cart,color: Colors.deepPurple,),onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Cart(),),
                );
              },
              ),
              IconButton(icon: Icon(Icons.favorite_border,color: Colors.deepPurple,),onPressed: (){},),
            ],
          ),
           Divider(color: Colors.deepPurple.shade500),
           ListTile(
             tileColor: Colors.yellow.shade50,
             title: Text('Product Description',
               style: TextStyle(fontWeight: FontWeight.bold,
               ),
             ),
             subtitle: Text(widget.product_details_description),
           ),
          Divider(color: Colors.deepPurple.shade100),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: Text("Manufacturer :",style: TextStyle(
                  color: Colors.deepPurple,
                  fontSize: 15
                ),),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Text(widget.product_details_manufacturer,
                style: TextStyle(
                  color: Colors.redAccent,
                ),),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: Text("Quantity :",style: TextStyle(
                  color: Colors.deepPurple,
                  fontSize: 15
                ),),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Text('${widget.product_details_quantity}',
                style: TextStyle(
                  color: Colors.redAccent,
                ),
                ),
              )
            ],
          ),
          //Similar product Section
          Divider(color: Colors.deepPurple.shade100),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Similar Products",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            height: 360.0,
            child:Similar_Products() ,
          )
        ],
      ),
    );
  }
}

class Similar_Products extends StatefulWidget {
  @override
  _SimilarProductsState createState() => _SimilarProductsState();
}

class _SimilarProductsState extends State<Similar_Products> {
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
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: products_list.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (BuildContext context, int index) {
        return Similar_Single_product(
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

class Similar_Single_product extends StatelessWidget {
  final product_name;
  final product_picture;
  final product_description;
  final product_price;
  final product_quantity;
  final product_manufacturer;

  Similar_Single_product(
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
                fit: BoxFit.cover,
              ),
              footer: Container(
                color: Colors.white70,
                child: ListTile(
                  leading: Text(
                    product_name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  title: Text(
                    'RS:$product_price',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        fontStyle: FontStyle.italic,
                        color: Colors.redAccent),
                  ),
                  /*subtitle:Text('RS:$product_price',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        fontStyle: FontStyle.italic,
                        color: Colors.redAccent
                    ),
                  ), */
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

