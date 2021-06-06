import 'package:flutter/material.dart';
import 'package:mokshya/pages/brand_details.dart';

class Brands extends StatefulWidget {

  @override
  _BrandsState createState() => _BrandsState();
}

class _BrandsState extends State<Brands> {
  var brand_listing=[
    {
      "name": "HKVISION",
      "picture": "images/brands/hkvision.png",
    },
    {
      "name": "ZKTECO",
      "picture": "images/brands/zkteco.png",
    },
     {
      "name": "TVT",
      "picture": "images/brands/tvt.png",
    },
    {
      "name": "UNIVIEW",
      "picture": "images/brands/uniview.jpg",
    },


  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: brand_listing.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemBuilder: (BuildContext context, int index) {
        return Single_brand_list(
          brand_name: brand_listing[index]['name'],
          brand_picture: brand_listing[index]['picture'],
        );
      },
    );
  }
}
class Single_brand_list extends StatelessWidget {
  final brand_name;
  final brand_picture;


  Single_brand_list(
      {
        this.brand_name,
        this.brand_picture,
      });

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.deepPurple.shade100,
      child: Hero(
        tag: brand_name,
        child: Material(
          child: InkWell(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                //passing the value of product from product.dart to product_details page
                builder: (context) => Brand_details(
                    brand_detail_name: brand_name,
                    brand_detail_picture: brand_picture,
                ),
              ),
            ),
            child: GridTile(
              child: Image(
                image: AssetImage(brand_picture),
              ),
              footer: Container(
                color: Colors.white60,
                height: 50.0,
                child: ListTile(
                  leading: Text(
                    brand_name,
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
