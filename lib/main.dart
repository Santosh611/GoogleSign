import 'package:flutter/material.dart';
import 'package:shoppyist/sign_in.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shoppyist',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        brightness: Brightness.dark,
      ),
      initialRoute: '/',
      routes: {
        // '/': (context) => const SignIn(),
        SignIn.route: (context) => const SignIn(),
      },
      home: const SignIn(),
    );
  }
}
