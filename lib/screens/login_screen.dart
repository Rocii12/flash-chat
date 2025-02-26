import 'package:flash_chat/constants.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/components/rounded_button.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  static const String id='login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showSpinner=false;
  final _auth=FirebaseAuth.instance;
  late String email;
  late String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
              tag: 'logo',
              child: Container(
                height: 200.0,
                child: Image.asset('images/logo.png'),
              ),
            ),
            SizedBox(
              height: 48.0,
            ),
            TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                 email=value;
                },
                decoration:kdecor.copyWith(hintText: 'Enter your email')
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                 password=value;
                },
                decoration: kdecor.copyWith(hintText: 'Enter your password')
            ),
            SizedBox(
              height: 24.0,
            ),
         RoundedButton(onpressed: ()async{
           setState(() {
             showSpinner=true;
           });
             try {
               final user = await _auth.signInWithEmailAndPassword(
                   email: email, password: password);
               if (user != null) {
                 Navigator.pushNamed(context, ChatScreen.id);
               }
               // setState(() {
               //   showSpinner=false;
               // });
             }
             catch(e){
               print(e);
             }
         },
         title: 'Log In',colour: Colors.lightBlueAccent,)
          ],
        ),
      ),
    );
  }
}