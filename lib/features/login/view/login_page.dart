import 'package:boilerplate/core/spacings/app_spacing.dart';
import 'package:boilerplate/core/themes/app_themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

part 'login_form.dart';

class LoginPage extends StatefulWidget {

  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                child: LoginForm(),)
            ],
          ),
        ),
      ),
    );
  }
}