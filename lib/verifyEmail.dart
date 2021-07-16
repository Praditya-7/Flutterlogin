import 'package:flutter/material.dart';
import 'package:userauth/HomeScreen.dart';
import 'package:email_auth/email_auth.dart';
import 'package:userauth/CreateAccount.dart';


class VerifyEmail extends StatefulWidget {
  VerifyEmail({this.email});
  final email;
  @override
  _VerifyEmailState createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.email);
  }
final TextEditingController otpCont =TextEditingController();
final CreateAccount user=CreateAccount();


bool verifyOTP( TextEditingController emailCont,TextEditingController otpCont){
  return (EmailAuth.validate(receiverMail: emailCont.value.text, userOTP: otpCont.value.text));
}

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Verify your Email"),
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
                if(verifyOTP(email,otpCont)==true){
                  Navigator.push(context, MaterialPageRoute(builder:(context)=>HomeScreen()));
                }

              }, child: Text("Verify"))),
        ],
      ),
    );
  }
}
