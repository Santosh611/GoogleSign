import 'package:flutter/material.dart';
import 'package:shoppyist/widgets/facebook_sign_in_button.dart';
import 'package:shoppyist/widgets/google_sign_in_button.dart';

import 'authentication/google_sign_in/authentication.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  static String route = '/sign_in';

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool passwordVisible = false;

  @override
  void initState() {
    super.initState();
    passwordVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double unitHeightValue = MediaQuery.of(context).size.height * 0.001;

    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.0373),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: size.height * 0.0487),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: size.height * 0.0388,
                          width: size.width * 0.09,
                        ),
                        Text(
                          "Shoppyist",
                          style: TextStyle(
                            fontSize: unitHeightValue * 18,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xff16b4f3),
                          ),
                        )
                      ],
                    ),

                    //Email TextFormField
                    Text(
                      'Email',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: unitHeightValue * 16),
                    ),
                    SizedBox(height: size.height * 0.012),
                    TextFormField(
                      controller: _emailController,
                      validator: (value) {
                        if (value == null || value == "") {
                          return "Field is required.";
                        }
                        if (value.length < 8 ||
                            !value.contains("@") ||
                            !value.contains(".")) {
                          return "Enter a valid email.";
                        }
                        return null;
                      },
                      style: TextStyle(fontSize: unitHeightValue * 17),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(unitHeightValue * 16),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: const Color(0xffd6d7dd),
                                width: unitHeightValue * 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: const Color(0xff50566a),
                                width: unitHeightValue * 2),
                          ),
                          hintText: 'Enter your Email'),
                    ),
                    SizedBox(height: size.height * 0.0194),
                    //Pasword TextFormField
                    Text(
                      'Password',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: unitHeightValue * 16),
                    ),
                    SizedBox(height: size.height * 0.012),
                    TextFormField(
                      obscureText: passwordVisible,
                      controller: _passwordController,
                      validator: (value) {
                        if (value == null || value == "") {
                          return "Field is required.";
                        }
                        if (value.length < 8) {
                          return "Password can't be shorter than 8 characters.";
                        }
                        return null;
                      },
                      style: TextStyle(fontSize: unitHeightValue * 17),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(unitHeightValue * 16),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: const Color(0xffd6d7dd),
                              width: unitHeightValue * 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: const Color(0xff50566a),
                              width: unitHeightValue * 2),
                        ),
                        hintText: 'Enter your Password',
                        suffixIcon: IconButton(
                          color: Colors.grey,
                          icon: Icon(passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(
                              () {
                                passwordVisible = !passwordVisible;
                              },
                            );
                          },
                        ),
                        alignLabelWithHint: false,
                        // filled: true,
                      ),
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.done,
                    ),
                    SizedBox(height: size.height * 0.041),
                    SizedBox(
                      width: double.infinity,
                      height: size.height * 0.058,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF16b4f3)),
                        onPressed: () async {},
                        child: Text(
                          'Signin',
                          style: TextStyle(fontSize: unitHeightValue * 18),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.0248),
                    Center(
                      child: Text(
                        'Signin with',
                        style: TextStyle(
                            fontSize: unitHeightValue * 14,
                            color: const Color(0xff888c9f)),
                      ),
                    ),
                    SizedBox(height: size.height * 0.0132),
                    Center(
                      child: Column(
                        children: [
                          FutureBuilder(
                            future: Authentication.initializeFirebase(
                                context: context),
                            builder: (context, snapshot) {
                              if (snapshot.hasError) {
                                return const Text(
                                    'Error initializing Firebase');
                              } else if (snapshot.connectionState ==
                                  ConnectionState.done) {
                                return const GoogleSignInButton();
                              }
                              return const CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Colors.amber,
                                ),
                              );
                            },
                          ),
                          SizedBox(height: size.height * 0.0282),
                          FutureBuilder(
                            future: Authentication.initializeFirebase(
                                context: context),
                            builder: (context, snapshot) {
                              if (snapshot.hasError) {
                                return const Text(
                                    'Error initializing Firebase');
                              } else if (snapshot.connectionState ==
                                  ConnectionState.done) {
                                return const FacebookSignButton();
                              }
                              return const CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Colors.amber,
                                ),
                              );
                            },
                          ),
                          SizedBox(width: size.width * 0.0282),
                        ],
                      ),
                    ),
                    SizedBox(height: size.height * 0.0369),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
