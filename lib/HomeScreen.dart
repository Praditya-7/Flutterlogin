import 'package:flutter/material.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: size.height/20,
          ),
          Container(
            height: size.height/20,
            width: size.width/20,
            alignment: Alignment.center,
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            ),
          ),
          SizedBox(
            height: size.height/20,
          ),
          Container(
            height: size.height/20,
            width: size.width/20,
            alignment: Alignment.center,
            child: ElevatedButton(
              child: Text("Search"),
              onPressed: (){
                
              },
            ),
          )
        ],
      )
    );
  }
}
