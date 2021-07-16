import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:userauth/HomeScreen.dart';
import 'package:userauth/LoginScreen.dart';
class Authenticate extends StatelessWidget {
  final FirebaseAuth _auth=FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    if(_auth.currentUser!=null){
      return HomeScreen();
    }
    else{
      return LoginScreen();
    }
  }
}