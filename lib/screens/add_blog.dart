// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_vietnam_experdition/db/database.dart';
import 'package:flutter_vietnam_experdition/models/blog.dart';
import 'package:flutter_vietnam_experdition/models/user.dart';

class AddBlog extends StatefulWidget {
  final int userId;
  final User user;

  const AddBlog({
    Key? key,
    required this.userId,
    required this.user,
  }) : super(key: key);

  @override
  _AddBlogState createState() => _AddBlogState();
}

class _AddBlogState extends State<AddBlog> {
  late TextEditingController blognameController;
  late TextEditingController blogtitleController;
  late TextEditingController blogcontentController;
  late TextEditingController locationController;
  late TextEditingController userNameController;

  String blogname = '';
  String blogtitle = '';
  String blogcontent = '';
  String location = '';
  String userName = '';

  @override
  void initState() {
    blognameController = TextEditingController();
    blogtitleController = TextEditingController();
    blogcontentController = TextEditingController();
    locationController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    blognameController = TextEditingController();
    blogtitleController = TextEditingController();
    blogcontentController = TextEditingController();
    locationController = TextEditingController();
    super.dispose();
  }

  void CreateBlog() {
    blogname = blognameController.text;
    blogtitle = blogtitleController.text;
    blogcontent = blogcontentController.text;
    location = locationController.text;
    createblog();
  }

  Future createblog() async {
    await VNEdatabase.instance.createBlog(Blog(
      blogName: blogname,
      blogTitle: blogtitle,
      postTime: DateTime.now(),
      blogContent: blogcontent,
      urlImage: "assets/images/blogs/default_blog.jpg",
      location: location,
      userName: widget.user.fullName,
    ));
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
                padding: EdgeInsets.all(5),
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.9,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Thêm blog mới'.toUpperCase(),
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w600,
                              color: Colors.deepOrange,
                            ),
                          ),
                        ],
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
                            border: InputBorder.none,
                            hintText: "Tên Blog",
                            hintStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          controller: blognameController,
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
                            border: InputBorder.none,
                            hintText: "Tiêu đề Blog",
                            hintStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          controller: blogtitleController,
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
                            border: InputBorder.none,
                            hintText: "Địa điểm của Quốc gia nào ?",
                            hintStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          controller: locationController,
                        ),
                      ),
                      SizedBox(height: 5),
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        width: MediaQuery.of(context).size.width * 0.7,
                        height: 300,
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: TextField(
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Nội dung...",
                            hintStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          controller: blogcontentController,
                          maxLines: 14,
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.all(10),
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: ElevatedButton(
                              onPressed: () {
                                CreateBlog();
                                Navigator.pop(context);
                              },
                              child: Text(
                                'Thêm'.toUpperCase(),
                              ),
                              style: ElevatedButton.styleFrom(
                                shape: StadiumBorder(),
                                primary: Colors.deepOrange,
                                onPrimary: Colors.white,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(10),
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
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
