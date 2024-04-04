import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.buttonColor,
      required this.buttonHeight,
      required this.buttonWidth,
      required this.buttonBorderRadius,
      required this.buttonTextColor,
      required this.fontSize,
      required this.fontWeight,
      required this.function,
      required this.buttonText

      });
  final String buttonText;
  final dynamic buttonColor;
  final double buttonHeight;
  final double buttonWidth;
  final double buttonBorderRadius;
  final dynamic buttonTextColor;
  final double fontSize;
  final FontWeight fontWeight;
  // We can also do it like "final VoidCallBack function" 
  final  Function() function;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: function,
      style: ButtonStyle(
          textStyle: MaterialStateProperty.all(
             TextStyle(fontSize: fontSize, fontWeight: fontWeight),
          ),
          backgroundColor: MaterialStateProperty.all(buttonColor),
          padding: MaterialStateProperty.all(EdgeInsets.symmetric(
              horizontal: buttonWidth, vertical: buttonHeight)),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(buttonBorderRadius)))),
      child: Text(
        buttonText,
        style: TextStyle(color: buttonTextColor),
      ),
    );
  }
}
