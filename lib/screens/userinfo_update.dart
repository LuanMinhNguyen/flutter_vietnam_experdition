// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, unnecessary_new

import 'package:flutter/material.dart';
import 'package:flutter_vietnam_experdition/db/database.dart';
import 'package:flutter_vietnam_experdition/models/user.dart';
import 'package:intl/intl.dart';

class UpdateInfo extends StatefulWidget {
  final int userId;
  final User user;
  const UpdateInfo({
    Key? key,
    required this.user,
    required this.userId,
  }) : super(key: key);

  @override
  _UpdateInfoState createState() => _UpdateInfoState();
}

class _UpdateInfoState extends State<UpdateInfo> {
  late TextEditingController birthdayController;
  late TextEditingController sexController;
  late TextEditingController fullnameController;
  late TextEditingController comefromController;

  String birthday = '';
  String sex = '';
  String fullname = '';
  String comefrom = '';

  @override
  void initState() {
    birthdayController = TextEditingController();
    sexController = TextEditingController();
    fullnameController = TextEditingController();
    comefromController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    birthdayController = TextEditingController();
    sexController = TextEditingController();
    fullnameController = TextEditingController();
    comefromController = TextEditingController();
    super.dispose();
  }

  void Update() async {
    birthday = birthdayController.text;
    sex = sexController.text;
    fullname = fullnameController.text;
    comefrom = comefromController.text;

    await VNEdatabase.instance.updateUser(User(
      userId: widget.userId,
      userName: widget.user.userName,
      dateOfBirth: birthday,
      urlAvatar: widget.user.urlAvatar,
      userPassword: widget.user.userPassword,
      userFrom: comefrom,
      fullName: fullname,
      sex: sex,
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
      // ignore: curly_braces_in_flow_control_structures
      setState(() {
        birthdayController.text =
            DateFormat('yyyy-MM-dd').format(selected).toString();
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe8e8e8),
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.8,
                decoration: BoxDecoration(
                  color: Colors.white,
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
                        color: Colors.black12,
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
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      width: MediaQuery.of(context).size.width * 0.7,
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TextField(
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.person_outline_rounded,
                            color: Colors.black,
                          ),
                          border: InputBorder.none,
                          hintText: "Giới tính",
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        controller: sexController,
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      width: MediaQuery.of(context).size.width * 0.7,
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TextField(
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.person_rounded,
                            color: Colors.black,
                          ),
                          border: InputBorder.none,
                          hintText: "Họ tên",
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        controller: fullnameController,
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      width: MediaQuery.of(context).size.width * 0.7,
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TextField(
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.location_city_rounded,
                            color: Colors.black,
                          ),
                          border: InputBorder.none,
                          hintText: "Đến từ...",
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        controller: comefromController,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: ElevatedButton(
                        onPressed: () {
                          Update();
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Lưu'.toUpperCase(),
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: StadiumBorder(),
                          primary: Colors.deepOrange,
                          onPrimary: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(0),
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Quay lại'.toUpperCase(),
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: StadiumBorder(),
                          primary: Colors.lightBlue,
                          onPrimary: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
