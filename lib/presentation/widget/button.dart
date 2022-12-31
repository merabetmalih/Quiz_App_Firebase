import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tp3/configs/AppColors.dart';

class Button extends StatelessWidget {
  final String buttonLabel;

  final Function() onPressed;

  Button({required this.buttonLabel, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
        minWidth: 150,
        height: 60,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Theme.of(context).accentColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Text(
              buttonLabel,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: onPressed));
  }
}
