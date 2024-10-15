import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lostnfound_app/reuseable_widgets/reuseable_widgets.dart';
import 'package:lostnfound_app/screens/home_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});
  @override
  State<SignupScreen> createState() {
    return _SignUpScreenState();
  }
}

class _SignUpScreenState extends State<SignupScreen> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _userNameTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Sign Up',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 48, 44, 44),
              Color.fromARGB(255, 91, 115, 128),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 120, 20, 0),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 50,
                ),
                reusableTextField('Enter UserName', Icons.person_outline, false,
                    _userNameTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField('Enter Email Id', Icons.email_rounded, false,
                    _emailTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField('Enter UserName', Icons.lock_outline, false,
                    _passwordTextController),
                const SizedBox(
                  height: 20,
                ),
                signINSignUpButton(context, false, () {
                  //firebase add
                  FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                          email: _emailTextController.text,
                          password: _passwordTextController.text)
                      .then((value) {
                        print('Created New Account');
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  HomeScreen(),
                        ));
                  }).onError((error, StackTrace) {
                    print('Error ${error.toString()}');
                  });
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
