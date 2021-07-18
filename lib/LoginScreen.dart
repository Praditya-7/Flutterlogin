import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:userauth/Methods.dart';
import 'package:userauth/CreateAccount.dart';
import 'package:userauth/HomeScreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _email=TextEditingController();
  final TextEditingController _password=TextEditingController();
  bool isLoading=false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return isLoading? Center(child: Container(
      height: size.height/20,
      width: size.width/20,
      child: CircularProgressIndicator(),
    ),):Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: size.height / 5,
            ),
            Container(
              width: size.width/1.3,
              child: Text(
                "Welcome",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              width: size.width/1.3,
              child: Text(
                  "Sign in to continue",
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              height: size.height / 20,
            ),
            field(size, "Enter your Email",Icons.email,_email),
            SizedBox(
              height: size.height / 20,
            ),
            field(size,"Enter Password", Icons.lock,_password),
            SizedBox(
              height: size.height / 20,
            ),
            customButton(size),
            SizedBox(
              height: size.height/40,
            ),
            GestureDetector(
              onTap: (){
               Navigator.of(context).push(MaterialPageRoute(builder: (_)=>CreateAccount()));
                //Navigator.pushNamed(context, CreateAccount.route);
              },
              child: Text("create account",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),),
            ),
          ],
        ),
      ),
    );
  }

  Widget field(Size size,String hint,IconData icon,TextEditingController cont){
    return Container(
      padding: EdgeInsets.only(left: 20.0),
      width: size.width/1.1,
      height: size.height/14,
      child: TextField(
        controller: cont,
        textAlignVertical:TextAlignVertical.center,
        decoration: InputDecoration(
          alignLabelWithHint:true,
          prefixIcon: Icon(icon),
          hintText: hint,
          hintStyle: TextStyle(
            color: Colors.grey,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )
        ),
      ),
    );
  }

  Widget customButton(Size size){
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints.tightFor(width: 125,height: 50),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.purple,
          ),
          child: Text("Login",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22.0
          ),
          ),
          onPressed: (){
            if(_email.text.isNotEmpty && _password.text.isNotEmpty){
              setState(() {
                isLoading=true;
              });
              login(_email.text, _password.text).then((user){
                if(user!= null){
                  print("Login Successful");
                  setState(() {
                    isLoading=false;
                  });
                  Navigator.push(context, MaterialPageRoute(builder:(_)=>HomeScreen()));
                }
                else{
                  setState(() {
                    isLoading=false;
                  });
                  print("Login Failed");
                  setState(() {
                    isLoading=false;
                  });
                }
              });
            }
            else{
              print("Enter the required Credentials");
            }
          },
        ),
      ),
    );
  }
}
