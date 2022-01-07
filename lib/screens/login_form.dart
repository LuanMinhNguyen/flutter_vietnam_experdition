// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, non_constant_identifier_names, unused_field, unnecessary_this, prefer_const_literals_to_create_immutables, avoid_print, unnecessary_new

import 'package:flutter_vietnam_experdition/db/database.dart';
import 'package:flutter_vietnam_experdition/main.dart';
import 'package:flutter_vietnam_experdition/models/user.dart';
import 'package:flutter_vietnam_experdition/screens/signup_form.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  List<User> users = [];
  bool isLoading = false;

  late TextEditingController emailController;
  late TextEditingController passwordController;
  String email = '';
  String password = '';

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    refresh();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void refresh() async {
    setState(() => isLoading = true);

    this.users = await VNEdatabase.instance.readAllUsers();

    setState(() => isLoading = false);
  }

  void Login() {
    refresh();
    email = emailController.text;
    password = passwordController.text;

    for (int i = 0; i < users.length; i++) {
      print(users[i].userName);
      if (users[i].userName == email && users[i].userPassword == password) {
        setState(() {
          final user = users[i];
          loginToProfilePage.userId = user.userId!;
          loginToProfilePage.user = user;
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => new MainPage(
              userId: user.userId!,
              user: user,
            ),
          ));
        });
        return;
      }
    }
    showDialog(
      context: context,
      builder: (BuildContext context) =>
          popupDialog(context, 'Sai Email hoặc Mật khẩu'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(0),
            margin: EdgeInsets.all(0),
            width: double.infinity,
            height: double.infinity,
            child: ClipRRect(
              child: Image(
                image: AssetImage('assets/images/login_signup_bg.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: MediaQuery.of(context).size.height * 0.8,
                      decoration: BoxDecoration(
                        color: Colors.white12,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 50),
                            padding: EdgeInsets.symmetric(
                              horizontal: 20,
                            ),
                            child: ClipRRect(
                              child: Image(
                                image: AssetImage('assets/images/logo.png'),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            width: MediaQuery.of(context).size.width * 0.7,
                            decoration: BoxDecoration(
                              color: Colors.white70,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: TextField(
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                icon: Icon(
                                  Icons.mail_rounded,
                                  color: Colors.black,
                                ),
                                border: InputBorder.none,
                                hintText: "Email của bạn",
                                hintStyle: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                              controller: emailController,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            width: MediaQuery.of(context).size.width * 0.7,
                            decoration: BoxDecoration(
                              color: Colors.white70,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: TextField(
                              cursorColor: Colors.black,
                              obscureText: true,
                              decoration: InputDecoration(
                                icon: Icon(
                                  Icons.lock_rounded,
                                  color: Colors.black,
                                ),
                                border: InputBorder.none,
                                hintText: "Mật khẩu",
                                hintStyle: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                                suffixIcon: Icon(
                                  Icons.visibility_rounded,
                                  color: Colors.black,
                                ),
                              ),
                              controller: passwordController,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 20),
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: ElevatedButton(
                              onPressed: Login,
                              child: Text(
                                'Đăng nhập'.toUpperCase(),
                              ),
                              style: ElevatedButton.styleFrom(
                                shape: StadiumBorder(),
                                primary: Colors.deepOrange,
                                onPrimary: Colors.white,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Bạn chưa có tài khoản ? ',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => SignUpPage(),
                                      ));
                                },
                                child: Text(
                                  'Đăng ký',
                                  style: TextStyle(
                                    color: Colors.lightBlue,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget popupDialog(BuildContext context, String text) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(text),
        ],
      ),
      actions: <Widget>[
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('OK'),
        ),
      ],
    );
  }
}
