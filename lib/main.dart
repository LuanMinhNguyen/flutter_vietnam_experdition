// ignore_for_file: prefer_const_constructors, unnecessary_this, deprecated_member_use, unnecessary_null_comparison, prefer_final_fields, unused_field
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vietnam_experdition/models/blog.dart';
import 'package:flutter_vietnam_experdition/models/hotel.dart';
import 'package:flutter_vietnam_experdition/models/user.dart';
import 'package:flutter_vietnam_experdition/screens/favorite_page.dart';
import 'package:flutter_vietnam_experdition/screens/home_page.dart';
import 'package:flutter_vietnam_experdition/screens/login_form.dart';
import 'package:flutter_vietnam_experdition/screens/profile_page.dart';
import 'package:flutter_vietnam_experdition/screens/search_page.dart';
import 'db/database.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.black26,
  ));
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  if ((await VNEdatabase.instance.readAllBlogs()).isEmpty) {
    await VNEdatabase.instance.createBlog(venice);
    await VNEdatabase.instance.createBlog(caobang);
    await VNEdatabase.instance.createBlog(sydney);
    await VNEdatabase.instance.createBlog(athens);
    await VNEdatabase.instance.createBlog(barcelona);
  }

  if ((await VNEdatabase.instance.readAllHotels()).isEmpty) {
    await VNEdatabase.instance.createHotel(rialto);
    await VNEdatabase.instance.createHotel(maxboutique);
    await VNEdatabase.instance.createHotel(midtownluxury);
    await VNEdatabase.instance.createHotel(MandysPalace);
    await VNEdatabase.instance.createHotel(CaBonfadiniHistoricExperience);
  }

  if ((await VNEdatabase.instance.readAllUsers()).isEmpty) {
    await VNEdatabase.instance.createUser(user1);
    await VNEdatabase.instance.createUser(user2);
  }

  await VNEdatabase.instance.deleteUser(3);
  await VNEdatabase.instance.deleteUser(4);

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Vietnam Experdition',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Montserrat',
      ),
      home: const LoginPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  final int userId;
  final User user;

  const MainPage({
    Key? key,
    required this.userId,
    required this.user,
  }) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late User user;
  bool isLoading = false;

  final navigationKey = GlobalKey<CurvedNavigationBarState>();
  int index = 0;

  final screens = [
    HomePage(),
    SearchPage(),
    FavouritePage(),
    ProfilePage(
      userId: loginToProfilePage.userId,
      user: loginToProfilePage.user,
    ),
  ];

  @override
  void initState() {
    super.initState();

    refresh();
  }

  Future refresh() async {
    setState(() => isLoading = true);

    this.user = await VNEdatabase.instance.readUser(widget.userId);

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      Icon(Icons.home, size: 30, color: Colors.black),
      Icon(Icons.search, size: 30, color: Colors.black),
      Icon(Icons.favorite, size: 30, color: Colors.black),
      ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Image(
          image: AssetImage(
            widget.user.urlAvatar,
          ),
          width: 30,
          height: 30,
        ),
      ),
    ];
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: CurvedNavigationBar(
        key: navigationKey,
        height: 60,
        color: Color(0xffffffff),
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: Color(0xffffffff),
        index: index,
        items: items,
        animationDuration: const Duration(milliseconds: 250),
        onTap: (index) => setState(() => this.index = index),
      ),
      body: screens[index],
    );
  }
}
