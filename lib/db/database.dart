// ignore_for_file: unnecessary_null_comparison, prefer_const_declarations, avoid_print

import 'package:flutter_vietnam_experdition/models/blog.dart';
import 'package:flutter_vietnam_experdition/models/hotel.dart';
import 'package:flutter_vietnam_experdition/models/user.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class VNEdatabase {
  static final VNEdatabase instance = VNEdatabase._init();

  static Database? _database;

  VNEdatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('database.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';

    await db.execute('''
CREATE TABLE $tableBlogs(
  ${BlogFields.id} $idType,
    ${BlogFields.blogName} $textType,
    ${BlogFields.blogTitle} $textType,
    ${BlogFields.postTime} $textType,
    ${BlogFields.blogContent} $textType,
    ${BlogFields.urlImage} $textType,
    ${BlogFields.location} $textType,
    ${BlogFields.userName} $textType
  )
''');

    await db.execute('''
CREATE TABLE $tableHotels(
  ${HotelFields.hotelId} $idType,
    ${HotelFields.hotelName} $textType,
    ${HotelFields.hotelAddress} $textType,
    ${HotelFields.hotelUrlImage} $textType,
    ${HotelFields.startTime} $textType,
    ${HotelFields.endTime} $textType,
    ${HotelFields.hotelLocation} $textType
  )
''');

    await db.execute('''
CREATE TABLE $tableUsers(
  ${UserFields.userId} $idType,
    ${UserFields.userName} $textType,
    ${UserFields.dateOfBirth} $textType,
    ${UserFields.urlAvatar} $textType,
    ${UserFields.userPassword} $textType,
    ${UserFields.userFrom} $textType,
    ${UserFields.fullName} $textType,
    ${UserFields.sex} $textType
  )
''');
  }

  Future<Blog> createBlog(Blog blog) async {
    final db = await instance.database;

    final id = await db.insert(tableBlogs, blog.toJson());
    return blog.copy(id: id);
  }

  Future<Blog> readBlog(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tableBlogs,
      columns: BlogFields.values,
      where: '${BlogFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Blog.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<Blog>> readAllBlogs() async {
    final db = await instance.database;

    final orderBy = '${BlogFields.postTime} DESC';

    final result = await db.query(tableBlogs, orderBy: orderBy);

    return result.map((json) => Blog.fromJson(json)).toList();
  }

  Future<int> updateBlog(Blog blog) async {
    final db = await instance.database;

    return db.update(
      tableBlogs,
      blog.toJson(),
      where: '${BlogFields.id} = ?',
      whereArgs: [blog.id],
    );
  }

  Future<int> deleteBlog(int id) async {
    final db = await instance.database;

    return await db.delete(
      tableBlogs,
      where: '${BlogFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future closeBlog() async {
    final db = await instance.database;

    db.close();
  }

  Future<Hotel> createHotel(Hotel hotel) async {
    final db = await instance.database;

    final id = await db.insert(tableHotels, hotel.toJson());
    return hotel.copy(hotelId: id);
  }

  Future<Hotel> readHotel(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tableHotels,
      columns: HotelFields.values,
      where: '${HotelFields.hotelId} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Hotel.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<Hotel>> readAllHotels() async {
    final db = await instance.database;

    final orderBy = '${HotelFields.hotelId} DESC';

    final result = await db.query(tableHotels, orderBy: orderBy);

    return result.map((json) => Hotel.fromJson(json)).toList();
  }

  Future<List<Hotel>> readHotelsWithLocation(String location) async {
    final db = await instance.database;

    final orderBy = '${HotelFields.hotelId} DESC';

    final where = '${HotelFields.hotelLocation} = ?';

    final result = await db.query(tableHotels,
        orderBy: orderBy, where: where, whereArgs: [location]);

    return result.map((json) => Hotel.fromJson(json)).toList();
  }

  Future<int> updateHotel(Hotel hotel) async {
    final db = await instance.database;

    return db.update(
      tableHotels,
      hotel.toJson(),
      where: '${HotelFields.hotelId} = ?',
      whereArgs: [hotel.hotelId],
    );
  }

  Future<int> deleteHotel(int id) async {
    final db = await instance.database;

    return await db.delete(
      tableHotels,
      where: '${HotelFields.hotelId} = ?',
      whereArgs: [id],
    );
  }

  Future closeHotel() async {
    final db = await instance.database;

    db.close();
  }

  Future<User> createUser(User user) async {
    final db = await instance.database;

    final id = await db.insert(tableUsers, user.toJson());
    return user.copy(userId: id);
  }

  Future<User> readUser(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tableUsers,
      columns: UserFields.values,
      where: '${UserFields.userId} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return User.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<User>> readAllUsers() async {
    final db = await instance.database;

    final orderBy = '${UserFields.userId} DESC';

    final result = await db.query(tableUsers, orderBy: orderBy);

    return result.map((json) => User.fromJson(json)).toList();
  }

  Future<int> updateUser(User user) async {
    final db = await instance.database;

    return db.update(
      tableUsers,
      user.toJson(),
      where: '${UserFields.userId} = ?',
      whereArgs: [user.userId],
    );
  }

  Future<int> deleteUser(int id) async {
    final db = await instance.database;

    return await db.delete(
      tableUsers,
      where: '${UserFields.userId} = ?',
      whereArgs: [id],
    );
  }

  Future closeUser() async {
    final db = await instance.database;

    db.close();
  }
}
