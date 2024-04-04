import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp/colors.dart';
import 'package:whatsapp/features/landing/screens/landing_screen.dart';
import 'package:whatsapp/firebase_options.dart';
import 'package:whatsapp/router.dart';
// import 'package:upchat/screens/mobileLayoutScreen.dart';
// import 'package:upchat/screens/webLayoutScreen.dart';
// import 'package:upchat/utils/responsiveLayout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ProviderScope(child: MyApp()));
  //If you are using riverpod you have to have Provider scope at the root of your widget tree
  //Provider scope widget is a widget provided by riverpod that keeps track of the state of the application
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Upchat',
      theme: ThemeData.dark().copyWith(
        appBarTheme:const AppBarTheme(color: appBarColor),
        scaffoldBackgroundColor: backgroundColor,
      ),
      onGenerateRoute:(settings) => generateRoute(settings),
      home: const LandingScreen()
      // const ResponsiveLayout(
      //   mobileScreenLayout: MobileLayoutScreen(),
      //   webScreenLayout: WebLayoutScreen(),
      // ),
    );
  }
}

