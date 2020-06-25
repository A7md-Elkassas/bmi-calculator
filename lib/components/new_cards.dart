import 'package:flutter/material.dart';

class NewCards extends StatelessWidget {
  NewCards({@required this.colored, this.cardChild, this.onPress});

  final Color colored;
  final Widget cardChild;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: colored,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
