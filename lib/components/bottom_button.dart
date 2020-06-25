import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {

  BottomButton({@required this.tapp,@required this.title});

  final Function tapp;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tapp,
      child: Container(
        padding: EdgeInsets.only(bottom: 20),
        child: Center(child: Text(title,style: kCacluteButton,)),
        color: kBottomContainerColor,
        margin: EdgeInsets.only(top: 10),
        width: double.infinity,
        height: kBottomContainerHeight,
      ),
    );
  }
}