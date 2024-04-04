import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp/colors.dart';
import 'package:whatsapp/features/auth/contoller/auth_controller.dart';


// Here if we are using Riverpod as a package for state management then for a stateless widget
// Instead for stateless widget we Make it consumer widget 
class OTPScreen extends ConsumerWidget {
  const OTPScreen({
    super.key,
    required this.verificationId,
  });
  static const String routeName = '/otp-screen';
  final String verificationId;

  void verifyOTP(WidgetRef ref ,BuildContext context, String userOTP){
    ref.read(authCoontrollerProvider).verifyOTP(context, verificationId, userOTP);
  }

  @override
  Widget build(BuildContext context , WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back)),
        backgroundColor: backgroundColor,
        title: const Text(
          '   Verifying Your Number',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            const Text('We have sent and SMS with a code'),
            SizedBox(
                width: size.width * 0.5,
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                      hintText: '- - - - - -',
                      hintStyle: TextStyle(fontSize: 30)),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    if(value.length == 6){
                      verifyOTP(ref, context, value.trim());
                    }
                  },
                ))
          ],
        ),
      ),
    );
  }
}
