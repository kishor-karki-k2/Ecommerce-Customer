import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

//self imports
import 'package:mokshya/components/horizontal_listview.dart';
import 'package:mokshya/components/products.dart';
import 'package:mokshya/pages/cart.dart';
import 'package:mokshya/components/featured_product.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mokshya/components/brands.dart';
import 'package:mokshya/pages/message.dart';
import 'package:mokshya/pages/account.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  int _currentIndex=0;
  final List<Widget> _children=[
    Homepage(),
    Message(),
    Cart(),
    AccountPage()
  ];

  void onTappedBar(int index)
  {
    setState(() {
      _currentIndex=index;
    });
  }


  @override
  Widget build(BuildContext context) {
    Widget image_carousal = new Container(
      height: 250.0,
      child: Carousel(
        images: [
          AssetImage('images/back_monitor.jpg'),
          AssetImage('images/back_biometric.png'),
          AssetImage('images/back_cam.jpg'),
          AssetImage('images/back_cake.png'),
          AssetImage('images/back_harddisk.png'),
          AssetImage('images/back_switch.png'),
        ],
        autoplay: false,
        animationCurve: Curves.fastOutSlowIn,
        dotSize: 4.0,
        indicatorBgPadding: 10.0,
        animationDuration: Duration(
          microseconds: 500,
        ),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        title: Text(' Mokshya Store'),
        actions: [
          new IconButton(icon: Icon(Icons.search),
            onPressed:(){

            },),
          new IconButton(icon: Icon(Icons.shopping_cart),
            onPressed: (){
          Navigator.push(context,MaterialPageRoute(builder: (context)=>Cart()));
            },),
        ],

      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        iconSize: 20.0,
        selectedFontSize: 17,
        unselectedFontSize: 15.0,
        selectedItemColor: HexColor("#0360BC"),
        unselectedItemColor: HexColor("#660099"),

        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.message),
            title: new Text('Messages'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.shopping_cart),
            title: new Text('Cart'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text('Profile')
          )
        ],
        onTap: (index){
          _currentIndex=index;
          setState(() {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>_children[_currentIndex]));
          });
        },
      ),

      body: SafeArea(
        child: Container(
          color: HexColor("#E5FAFB"),
          child: ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: [
              //calling widget image_carousal
              image_carousal,
              Padding(
                //padding widget for Categories
                padding: EdgeInsets.all(10.0),
                child: Text('OUR CATAGORIES',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                  fontSize: 15
                ),),
              ),
              //horizontal list view remains here
              HorizontalList(),
              //padding widget for GridView
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text('LATEST PRODUCT',
                    style: TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                    fontSize: 15
                ),),
              ),
              //gridview of product
              Container(
                height: 300.0,
                child: Products(),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text('FEATURED PRODUCT',
                    style: TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                    fontSize: 15
                ),),
              ),
              Container(
                height: 300.0,
              child: FeaturedProduct(),
              ),
            //brands grid view
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text('BRANDS',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                      fontSize: 15
                  ),),
              ),
              Container(
                height: 300.0,
                child: Brands(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
