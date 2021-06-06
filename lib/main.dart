import 'package:flutter/material.dart';
import './pages/login.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    theme:ThemeData(
      primaryColor: Colors.deepPurple,
    ),
    debugShowCheckedModeBanner: false,
    home: Login(),
  ),);
}
