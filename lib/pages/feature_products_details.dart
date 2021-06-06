import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mokshya/pages/cart.dart';
import 'package:mokshya/pages/home.dart';

class FeatureProductDetails extends StatefulWidget {
  final feature_product_details_name;
  final feature_product_details_picture;
  final feature_product_details_price;
  final feature_product_details_quantity;
  final feature_product_details_description;
  final feature_product_details_manufacturer;

  FeatureProductDetails(
      {
        this.feature_product_details_name,
        this.feature_product_details_picture,
        this.feature_product_details_price,
        this.feature_product_details_quantity,
        this.feature_product_details_description,
        this.feature_product_details_manufacturer
      }
      );
  @override
  _FeatureProductDetailsState createState() => _FeatureProductDetailsState();
}

class _FeatureProductDetailsState extends State<FeatureProductDetails> {
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
                  image: AssetImage(widget.feature_product_details_picture),
                ),
              ),
              footer:Container(
                color: Colors.white70,
                child: ListTile(
                  leading: Text(widget.feature_product_details_name,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0
                    ),
                  ),
                  title: Row(
                    children: [
                      Expanded(
                        child: Text("RS:${widget.feature_product_details_price}",
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
            subtitle: Text(widget.feature_product_details_description),
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
                child: Text(widget.feature_product_details_manufacturer,
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
                child: Text('${widget.feature_product_details_quantity}',
                  style: TextStyle(
                    color: Colors.redAccent,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
