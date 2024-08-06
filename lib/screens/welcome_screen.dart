import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat/components/rounded_button.dart';
class WelcomeScreen extends StatefulWidget {
  static const String id='welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin{
  late AnimationController controller;
  late Animation animation;
  @override
  void initState() {
    
    super.initState();
      controller=AnimationController(duration: Duration(seconds: 1),
          vsync: this);
      animation=ColorTween(begin: Colors.white,end: Colors.redAccent).animate(controller);

    controller.forward();
    controller.addListener(() {
      setState(() {

      });
      print(animation.value);
    });
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();

  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 100.0,
                  ),
                ),
                AnimatedTextKit(animatedTexts: [TypewriterAnimatedText('Live Booth',

                  textStyle: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFF67666A),
                  ),

                ),
                ]

                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              colour: Colors.lightBlueAccent,title: 'Log In',onpressed: ()
              {
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
            RoundedButton(onpressed: (){
              Navigator.pushNamed(context, RegistrationScreen.id);
            },title: 'Register',colour: Colors.blueAccent,
            )
          ],
        ),
      ),
    );
  }
}
