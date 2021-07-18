import 'package:email_auth/email_auth.dart';
import 'package:flutter/material.dart';
import 'package:userauth/Methods.dart';
import 'package:userauth/LoginScreen.dart';
import 'package:userauth/verifyEmail.dart';


class CreateAccount extends StatefulWidget {
  @override
  _CreateAccountState createState() => _CreateAccountState();

}

class _CreateAccountState extends State<CreateAccount> {
   final TextEditingController _name=TextEditingController();
   final  TextEditingController email=TextEditingController();
   final TextEditingController _password=TextEditingController();
  bool isLoading=false;

  void sendOTP() async{
    EmailAuth.sessionName="test";
    var data=  await EmailAuth.sendOtp(receiverMail: email.value.text);
    if(!data){
      print("Unable to send OTP");
    }
    else{
      print("OTP sent");
    }
  }

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: isLoading? Center(child: Container(
          height: size.height/20,
          width: size.width/20,
          child: CircularProgressIndicator(),
        ),):SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        SizedBox(
          height: size.height / 20,
        ),
        Container(
            alignment: Alignment.centerLeft,
            width: size.width / 1.2,
            child: IconButton(icon: Icon(Icons.arrow_back), onPressed: () {
              Navigator.pop(context);
            })),
        SizedBox(
          height: size.height / 20,
        ),
        Container(
          width: size.width / 1.3,
          child: Text(
            "Welcome",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          width: size.width / 1.3,
          child: Text(
            "Create Your Account",
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(
          height: size.height / 20,
        ),
        field(size,"FullName", Icons.person,_name),
        SizedBox(
          height: size.height / 20,
        ),
        field(size, "Email", Icons.mail,email),
        SizedBox(
          height: size.height / 20,
        ),
        field(size, "Password", Icons.lock,_password),
        SizedBox(
          height: size.height / 20,
        ),
        customButton(size),
        SizedBox(
          height: size.height / 40,
        ),
        GestureDetector(
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (_)=>LoginScreen()));
            //Navigator.pushNamed(context, LoginScreen.route);
          },
          child: Text("Login",
            style: TextStyle(
              color: Colors.blue,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),),
        ),
      ]
      ),
    ));
  }
  Widget field(Size size,String hint,IconData icon,TextEditingController cont){
    return Center(
      child: Container(
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
      ),
    );
  }

  Widget customButton(Size size){
    return GestureDetector(
      onTap: (){
        if(_name.text.isNotEmpty && email.text.isNotEmpty && _password.text.isNotEmpty){
          setState(() {
            isLoading=true;
          });
          sendOTP();
          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>VerifyEmail(name: _name,email: email,password: _password,)), (context) => false);
        }
        else{
          print("Enter the required Fields");
        }
      },
      child: Container(
        width: size.width/1.2,
        height: size.height/14,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.deepPurpleAccent,
        ),
        alignment: Alignment.center,
        child: Text("Create Account",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
          ),),
      ),
    );
  }
}

