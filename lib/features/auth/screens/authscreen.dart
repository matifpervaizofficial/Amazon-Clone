// ignore_for_file: prefer_const_constructors

import 'package:amazonclone/constants/colors.dart';
import 'package:amazonclone/constants/widgets/custombutton.dart';
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
      backgroundColor: GlobalColors.greyBackgroundCOlor,
      body: SafeArea(
        child: Column(
          children: [
            Text(
              "Welcome ",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ).pOnly(left: 10),
            ListTile(
              tileColor: _auth == Auth.signup
                  ? GlobalColors.backgroundColor
                  : GlobalColors.greyBackgroundCOlor,
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
              Container(
                color: GlobalColors.backgroundColor,
                child: (Form(
                  key: _signupformkey,
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
                          hinttext: "Name", addcontroller: _nameController),
                      SizedBox(
                        height: 10,
                      ),
                      CustomButton(
                        height: 50,
                        width: 500,
                        BorderRadiusvalue: 10,
                        color: GlobalColors.secondaryColor,
                        ontap: () {},
                        textsize: 17,
                        title: "Create Account",
                      )
                    ],
                  ).p(10),
                )),
              ),
            ListTile(
              tileColor: _auth == Auth.signin
                  ? GlobalColors.backgroundColor
                  : GlobalColors.greyBackgroundCOlor,
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
            if (_auth == Auth.signin)
              (Container(
                color: GlobalColors.backgroundColor,
                child: (Form(
                  key: _signinformkey,
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
                      CustomButton(
                        height: 50,
                        width: 500,
                        BorderRadiusvalue: 10,
                        color: GlobalColors.secondaryColor,
                        ontap: () {},
                        textsize: 17,
                        title: "Create Account",
                      )
                    ],
                  ).p(10),
                )),
              )),
          ],
        ),
      ),
    );
  }
}
