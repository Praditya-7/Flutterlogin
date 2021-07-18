import 'package:flutter/material.dart';
import 'package:userauth/Methods.dart';
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: size.height/20,
          ),
          Center(child: Text("this is home Screen"),),
          Container(
            height: size.height/20,
            width: size.width/1.1,
            alignment: Alignment.center,
            child: ElevatedButton(
              child: Text("logOut"),
              onPressed: ()=> logout(context),
            ),
          ),
          SizedBox(
            height: size.height/20,
          ),
        ],
      )
    );
  }
}
