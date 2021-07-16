
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:userauth/LoginScreen.dart';

Future<User> createAccount(String name,String email,String password) async{
 FirebaseAuth _auth=FirebaseAuth.instance;

 try{
   User user=(await _auth.createUserWithEmailAndPassword(email: email, password: password)).user;
   if(user!=null){
    print("User account created sucessfully");

    //colletion('users')-> creates collection called users colletion('users').coc()-> insert document to collection user
   /* await _firestore.collection('users').doc(_auth.currentUser.uid).set({
      "Name": name,
      "Email ":email,
      "status ":"unavailable",
    });*/
    return user;
   }
   else{
    print("Error creating account");
    return user;
   }
 }
 catch(e){
   print(e);
   return null;
 }
}

Future<User> login(String email,String password) async{
 FirebaseAuth _auth = FirebaseAuth.instance;
 try{
  User user=(await _auth.signInWithEmailAndPassword(email: email, password: password)).user;
  if(user!=null){
   print("login sucesssfully") ;
   return user;
  }
  else{
   print("error logging in");
   return user;
  }
 }
catch(e){
  print(e);
  return null;
}
}

Future<User> logout(BuildContext context) async{
 FirebaseAuth _auth=FirebaseAuth.instance;
 try{
  await _auth.signOut().then((value){
    Navigator.push(context, MaterialPageRoute(builder: (_)=>LoginScreen()));
  });
 }
 catch(e){
  print(e);
  return null;
 }
}