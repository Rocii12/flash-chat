import 'package:flash_chat/constants.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/components/rounded_button.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id='registration_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
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
            Flexible(
              child: Hero(
                tag: 'logo',
                child: Container(
                  height: 200.0,
                  child: Image.asset('images/logo.png'),
                ),
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
           RoundedButton(onpressed: () async{
             // setState(() {
             //   showSpinner=true;
             // });
           // print(email);
           // print(password);
             try {
               final newUser = await _auth.createUserWithEmailAndPassword(
                   email: email, password: password);
               if (newUser != null) {
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

           title: 'Register',colour: Colors.blueAccent,)
          ],
        ),
      ),
    );
  }
}
