import 'package:camera/camera.dart';
import 'package:flash_chat/screens/camera_screen.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/screens/welcome_screen.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/camera_screen.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // cameras =await availableCameras();
  runApp(FlashChat());

}

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(


      initialRoute: ChatScreen.id,
      routes:{

        WelcomeScreen.id: (context)=> WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        ChatScreen.id : (context) => ChatScreen(),
        RegistrationScreen.id : (context) => RegistrationScreen(),

      },
    );
  }
}
