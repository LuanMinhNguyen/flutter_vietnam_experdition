// ignore_for_file: prefer_const_constructors, unnecessary_this, non_constant_identifier_names, curly_braces_in_flow_control_structures

import 'package:flutter_vietnam_experdition/db/database.dart';
import 'package:flutter_vietnam_experdition/models/user.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  List<User> users = [];
  bool isLoading = false;

  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  late TextEditingController birthdayController;
  String email = '';
  String password = '';
  String confirmPassword = '';
  String birthday = '';

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    birthdayController = TextEditingController();
    refresh();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future refresh() async {
    setState(() => isLoading = true);

    this.users = await VNEdatabase.instance.readAllUsers();

    setState(() => isLoading = false);
  }

  void Signup() {
    email = emailController.text;
    password = passwordController.text;
    confirmPassword = confirmPasswordController.text;
    birthday = birthdayController.text;
    for (int i = 0; i < users.length; i++) {
      if (users[i].userName == email) {
        showDialog(
          context: context,
          builder: (BuildContext context) =>
              popupDialog(context, 'Email đã có người sử dụng'),
        );
        return;
      } else {
        if (password != confirmPassword) {
          showDialog(
            context: context,
            builder: (BuildContext context) =>
                popupDialog(context, 'Xác nhận mật khẩu không khớp'),
          );
          return;
        } else {
          CreateUser();
          // refresh();
          showDialog(
            context: context,
            builder: (BuildContext context) =>
                popupDialog(context, 'Đăng ký thành công'),
          );
          return;
        }
      }
    }
  }

  Future CreateUser() async {
    await VNEdatabase.instance.createUser(User(
      userName: email,
      dateOfBirth: birthday,
      userPassword: password,
      urlAvatar: "assets/images/blank_avatar.png",
      fullName: "Chưa cập nhật !",
      sex: "Chưa cập nhật !",
      userFrom: "Chưa cập nhật !",
    ));
  }

  DateTime selectedDate = DateTime.now();

  _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1950),
      lastDate: DateTime(2050),
    );
    if (selected != null && selected != selectedDate)
      setState(() {
        birthdayController.text =
            DateFormat('yyyy-MM-dd').format(selected).toString();
      });
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
                                  size: 24,
                                ),
                                border: InputBorder.none,
                                hintText: "Email của bạn",
                                hintStyle: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
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
                                  size: 24,
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
                                  size: 24,
                                ),
                              ),
                              controller: passwordController,
                            ),
                          ),
                          SizedBox(height: 5),
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
                                  size: 24,
                                ),
                                border: InputBorder.none,
                                hintText: "Xác nhận mật khẩu",
                                hintStyle: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                                suffixIcon: Icon(
                                  Icons.visibility_rounded,
                                  color: Colors.black,
                                ),
                              ),
                              controller: confirmPasswordController,
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
                              decoration: InputDecoration(
                                icon: GestureDetector(
                                  onTap: () {
                                    _selectDate(context);
                                  },
                                  child: Icon(
                                    Icons.calendar_today_rounded,
                                    size: 24,
                                    color: Colors.black,
                                  ),
                                ),
                                border: InputBorder.none,
                                hintText: "Ngày / Tháng / Năm sinh",
                                hintStyle: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                              controller: birthdayController,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 20),
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: ElevatedButton(
                              onPressed: () => Signup(),
                              child: Text(
                                'Đăng ký'.toUpperCase(),
                              ),
                              style: ElevatedButton.styleFrom(
                                shape: StadiumBorder(),
                                primary: Colors.lightBlue,
                                onPrimary: Colors.white,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Bạn đã có tài khoản ? ',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  'Đăng nhập',
                                  style: TextStyle(
                                    color: Colors.deepOrange,
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
