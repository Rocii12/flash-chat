import 'package:flutter/material.dart';
class RoundedButton extends StatelessWidget {
  RoundedButton({required this.onpressed, this.colour, this.title});
  late VoidCallback onpressed;
  late String ? title;
  final Color ?colour;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: colour!,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onpressed,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            title!,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}