import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tanihara/bottom_navbar.dart';
import 'package:tanihara/notification.dart';
import 'package:tanihara/provider/internet_provider.dart';
import 'package:tanihara/provider/sign_in_provider.dart';
import 'login_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((context) => SignInProvider())),
        ChangeNotifierProvider(create: ((context) => InternetProvider())),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Tanihara',
        home: loginscreen(),
      ),
    );
  }
}
