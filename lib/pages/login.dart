//import 'package:chat_app/pages/signup.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mokshya/pages/signup.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'home.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  SharedPreferences preferences;
  bool loading = false;
  bool isLogedin = false;

  @override
  void initState() {
    super.initState();
    isSignedIn();
  }

  void isSignedIn() async {
    setState(() {
      loading = true;
    });
    preferences = await SharedPreferences.getInstance();
    isLogedin = await googleSignIn.isSignedIn();
    if (isLogedin) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Homepage()));
    }

    setState(() {
      loading = false;
    });
  }

  /*Future<User> handleSignIn() async {
    preferences = await SharedPreferences.getInstance();

    setState(() {
      loading = true;
    });
    GoogleSignInAccount googleUser = await googleSignIn.signIn();
    GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    User firebaseUser =
        (await firebaseAuth.signInWithCredential(credential)).user;
    //return firebaseUser;
    if (firebaseUser != null) {
      final QuerySnapshot result = await FirebaseFirestore.instance
          .collection("users")
          .where("id", isEqualTo: firebaseUser.uid)
          .get();
      final List<DocumentSnapshot> documents = result.docs;

      if (documents.length == 0)
      //insert the user collection
      {
        FirebaseFirestore.instance
            .collection("users")
            .doc(firebaseUser.uid)
            .set({
          "id": firebaseUser.uid,
          "name":firebaseUser.displayName,
          "profilePicture":firebaseUser.photoURL
        });
        await preferences.setString("id", firebaseUser.uid);
        await preferences.setString("name", firebaseUser.displayName);
        await preferences.setString("phtoUrl", firebaseUser.displayName);
      }
      else{
        await preferences.setString("id", documents[0]['id']);
        await preferences.setString("name", documents[0]['username']);
        await preferences.setString("photoUrl", documents[0]['photoUrl']);
      }
      Fluttertoast.showToast(msg: "Login Successful");
      setState(() {
        loading=false;
      });

    }else{}
  }*/
  Future handleSignIn() async {
    preferences = await SharedPreferences.getInstance();

    setState(() {
      loading = true;
    });

    GoogleSignInAccount googleUser = await googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
    await googleUser.authentication;

    AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);
        User firebaseUser = (await firebaseAuth.signInWithCredential(credential)).user;

    if (firebaseUser != null) {
      final QuerySnapshot result = await FirebaseFirestore.instance
          .collection("users")
          .where("id", isEqualTo: firebaseUser.uid)
          .get();
      final List<DocumentSnapshot> documents = result.docs;
      if (documents.length == 0) {
        //Insert the user to our collection
        FirebaseFirestore.instance
            .collection("users")
            .doc(firebaseUser.uid)
            .set({
          "id": firebaseUser.uid,
          "username": firebaseUser.displayName,
          "email": firebaseUser.email,
          "profilePicture": firebaseUser.photoURL
        });
        await preferences.setString("id", firebaseUser.uid);
        await preferences.setString("username", firebaseUser.displayName);
        await preferences.setString("email", firebaseUser.email);
        await preferences.setString("photoUrl", firebaseUser.displayName);
      } else {
        await preferences.setString("id", documents[0]['id']);
        await preferences.setString("username", documents[0]['username']);
        await preferences.setString("email", documents[0]['email']);
        await preferences.setString("photoUrl", documents[0]['photoUrl']);
      }
      Fluttertoast.showToast(msg: "Logged in successfully");
      setState(() {
        loading = false;
      });
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height / 3;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.asset(
            'images/background.jpg',
            fit: BoxFit.fill,
            width: double.infinity,
            height: double.infinity,
          ),
          Container(
            color: Colors.black.withOpacity(0.8),
            width: double.infinity,
            height: double.infinity,
          ),
         /* Container(
              alignment: Alignment.topCenter,
              child: Image.asset(
                'images/mokshya.png',
                width: 280.0,
                height: 240.0,
              )),*/
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 200.0),
              child: Center(
                child: Form(
                    key: _formKey,
                    child: ListView(
                      children: <Widget>[
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                          child: Material(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white.withOpacity(0.4),
                            elevation: 0.0,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: TextFormField(
                                controller: _emailTextController,
                                decoration: InputDecoration(
                                  hintText: "Email",
                                  icon: Icon(Icons.alternate_email),
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    Pattern pattern =
                                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                    RegExp regex = new RegExp(pattern);
                                    if (!regex.hasMatch(value))
                                      return 'Please make sure your email address is valid';
                                    else
                                      return null;
                                  }
                                },
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                          child: Material(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white.withOpacity(0.4),
                            elevation: 0.0,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: TextFormField(
                                controller: _passwordTextController,
                                decoration: InputDecoration(
                                  hintText: "Password",
                                  icon: Icon(Icons.lock_outline),
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "The password field cannot be empty";
                                  } else if (value.length < 6) {
                                    return "the password has to be at least 6 characters long";
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                          child: Material(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.deepPurple,
                              elevation: 0.0,
                              child: MaterialButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Homepage()));
                                },
                                minWidth: MediaQuery.of(context).size.width,
                                child: Text(
                                  "Login",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0),
                                ),
                              ),
                          ),
                        ),
                        Center(
                            child: FlatButton(
                              color: Colors.red.shade900,
                              textColor: Colors.white,
                              child: Text("SignIn with Google"),
                              onPressed: (){
                              handleSignIn();
                              },
                            ),),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Forgot password",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
//                          Expanded(child: Container()),

                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
                                },
                                child: Text(
                                  "Sign up",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.red),
                                ))),
                      ],
                    )),
              ),
            ),
          ),
          Visibility(
            visible: loading ?? true,
            child: Center(
              child: Container(
                alignment: Alignment.center,
                color: Colors.white.withOpacity(0.9),
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
