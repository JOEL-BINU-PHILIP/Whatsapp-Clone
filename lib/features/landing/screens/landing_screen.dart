import 'package:flutter/material.dart';
import 'package:whatsapp/colors.dart';
import 'package:whatsapp/common/widgets/customButton.dart';
import 'package:whatsapp/features/auth/screens/login_screen.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  void navigateToLoginScreen(BuildContext context){
    Navigator.pushNamed(context, LoginScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            ' Welcome to WhatsApp ',
            style: TextStyle(fontSize: 30),
          ),
          Padding(
            padding: const EdgeInsets.all(13.0),
            child: Image.asset(
              'assets/bg.png',
              color: Colors.green,
            ),
          ),
          const Text(
            'Read our Privacy Policy. Tap "Agree and Continue" \n to accept the Terms of Service',
            textAlign: TextAlign.center,
            style: TextStyle(color: greyColor),
          ),
          //see whetger we have to do refactoring
           CustomButton(
            function: () => navigateToLoginScreen(context),
              buttonText: "Agree and Continue",
              buttonColor: tabColor,
              buttonHeight: 15,
              buttonWidth: 80,
              buttonBorderRadius: 5,
              buttonTextColor: backgroundColor,
              fontSize: 18,
              fontWeight: FontWeight.bold)
        ],
      )),
    );
  }
}
