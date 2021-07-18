import 'package:flutter/material.dart';
import 'package:userauth/HomeScreen.dart';
import 'package:email_auth/email_auth.dart';
import 'package:userauth/CreateAccount.dart';

import 'Methods.dart';


class VerifyEmail extends StatefulWidget {
  VerifyEmail({this.name,this.password,this.email});
  final email;
  final name;
  final password;

  @override
  _VerifyEmailState createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.email);
    print(widget.name);
    print(widget.password);
  }
final TextEditingController otpCont =TextEditingController();
final CreateAccount user=CreateAccount();


bool verifyOTP( TextEditingController emailCont,TextEditingController otpCont){
  return (EmailAuth.validate(receiverMail: emailCont.value.text, userOTP: otpCont.value.text));
}

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    bool isLoading=false;
    return Scaffold(
      appBar: AppBar(
        title: Text("Verify your Email"),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          SizedBox(
            height: size.height/20,
          ),
          Container(
            height: size.height / 20,
            width: size.width / 1.1,
            alignment: Alignment.center,
            child: TextField(
              controller: otpCont,
              decoration: InputDecoration(
                  hintText: "Enter the OTP",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  )),
            ),
          ),
          SizedBox(
            height: size.height / 20,
          ),
          Container(
              alignment: Alignment.center,
              child: ElevatedButton(onPressed: () {
                TextEditingController email=widget.email;
               TextEditingController name=widget.name;
               TextEditingController password=widget.password;
                if(verifyOTP(email,otpCont)==true){
                  createAccount(name.text, email.text, password.text).then((user){
                    if(user!=null){
                      setState(() {
                        isLoading=false;
                      });
                      print("Account Created");
                      Navigator.push(context, MaterialPageRoute(builder:(context)=>HomeScreen()));
                      //Navigator.push(context, MaterialPageRoute(builder: (context)=>VerifyEmail(email: email)));
                    }
                    else{
                      print("Account creation failed");
                      setState(() {
                        isLoading=false;
                      });
                    }
                  });

                  //Navigator.pushNamed(context, HomeScreen.route);
                }

              }, child: Text("Verify"))),
        ],
      ),
    );
  }
}
