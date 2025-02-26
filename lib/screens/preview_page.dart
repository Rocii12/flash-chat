import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import '../constants.dart';

class PreviewPage extends StatelessWidget {
  const PreviewPage({Key? key, required this.picture}) : super(key: key);

  final XFile picture;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Image.file(File(picture.path), fit: BoxFit.cover, width: 250),
          const SizedBox(height: 10),
          TextButton(onPressed: (){

          }, child: Text('Caption',
            style: kSendButtonTextStyle,)),
          SizedBox(width: 10,),
          TextField(
            onChanged: (value) {

            }
          )
        ]),
      ),
    );
  }
}