import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Category(
            image_location: 'images/categories/security.png',
            image_caption: 'Security',
          ),
          Category(
            image_location: 'images/categories/food.png',
            image_caption: 'Food & Bevrages',
          ),
          Category(
            image_location: 'images/categories/cloth.jpg',
            image_caption: 'Clothing',
          ),
          Category(
            image_location: 'images/categories/books.png',
            image_caption: 'Books',
          ),
          Category(
            image_location: 'images/categories/medicine.png',
            image_caption: 'Medicine',
          ),


        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String image_location;
  final String image_caption;

  Category({
    this.image_location,
    this.image_caption

});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2.0),
      child: InkWell(
        onTap: (){},
        child: Container(
          width: 100,
          child: ListTile(
            title: Image.asset(image_location,height: 50.0,width: 50.0,),
            subtitle:Container(
              alignment: Alignment.topCenter,
              child: Text(image_caption),
            )
          ),
        ),
      ),
    );
  }
}

