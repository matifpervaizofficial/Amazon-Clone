// ignore_for_file: prefer_const_constructors

import 'package:amazonclone/constants/colors.dart';
import 'package:amazonclone/constants/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

//enum is used t keep track of the radio button
enum Auth { signin, signup }

class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth-screen';

  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  //initialize the enum value which we have declared over the top
  Auth _auth = Auth.signup;
  // _auth is an instance of class Auth
  // the Auth.signup tell us that this will be the default value of radio button
  final _signupformkey = GlobalKey<FormState>();
  final _signinformkey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _nameController = TextEditingController();
  // Dispose releases the memory allocated to the existing variables of the state
  void dispse() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text(
              "Welcome ",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ).pOnly(left: 10),
            ListTile(
              title: Text("Create Account"),
              leading: Radio(
                activeColor: GlobalColors.secondaryColor,
                value: Auth.signup,
                groupValue: _auth,
                onChanged: (Auth? value) {
                  setState(() {
                    _auth = value!;
                  });
                },
              ),
            ),
            if (_auth == Auth.signup)
              (Form(
                key: _signupformkey,
                child: Container(
                  child: Column(
                    children: [
                      CustomTextfield(
                          hinttext: "Email", addcontroller: _emailController),
                      SizedBox(
                        height: 10,
                      ),
                      CustomTextfield(
                          hinttext: "Password",
                          addcontroller: _passwordController),
                      SizedBox(
                        height: 10,
                      ),
                      CustomTextfield(
                          hinttext: "Name", addcontroller: _nameController)
                    ],
                  ),
                ).p(10),
              )),
            ListTile(
              title: Text("Sign in to Account"),
              leading: Radio(
                activeColor: GlobalColors.secondaryColor,
                value: Auth.signin,
                groupValue: _auth,
                onChanged: (Auth? value) {
                  setState(() {
                    _auth = value!;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
