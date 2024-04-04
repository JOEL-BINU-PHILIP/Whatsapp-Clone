import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp/features/auth/repository/auth_repository.dart';

final authCoontrollerProvider = Provider((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  //Provider.of<AuthRepository>(context);This is the meaning of the above code the ref.watch part
  return AuthController(authRepository: authRepository);
});

class AuthController {
  final AuthRepository authRepository;
  AuthController({required this.authRepository});

  void signInWithPhone(BuildContext context, String phoneNumber) {
    authRepository.signInWithPhone(phoneNumber, context);
  }

  void verifyOTP(BuildContext context, String verificationId, String userOTP) {
    
    authRepository.verifyOTP(
      context: context,
      verificationId: verificationId,
      userOTP: userOTP,
    );
  }
}
