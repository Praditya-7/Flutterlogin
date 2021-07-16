import 'package:flutter/material.dart';
import 'package:userauth/HomeScreen.dart';
import 'package:email_auth/email_auth.dart';
import 'package:userauth/CreateAccount.dart';


class VerifyEmail extends StatefulWidget {

  @override
  _VerifyEmailState createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
final TextEditingController otpCont =TextEditingController();
final CreateAccount user=CreateAccount();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Verify your Email"),
      ),
      body: Column(
        children: [
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
                if(user.verifyOTP(otpCont)==true){
                  Navigator.push(context, MaterialPageRoute(builder:(context)=>HomeScreen()));
                }

              }, child: Text("Verify"))),
        ],
      ),
    );
  }
}
