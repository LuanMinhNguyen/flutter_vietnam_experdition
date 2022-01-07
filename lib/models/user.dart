// ignore_for_file: camel_case_types, prefer_const_declarations, prefer_const_constructors, non_constant_identifier_names
final String tableUsers = 'users';

enum ImageSourceType { gallery, camera }

class User {
  final int? userId;
  final String userName;
  final String dateOfBirth;
  final String urlAvatar;
  final String userPassword;
  final String userFrom;
  final String fullName;
  final String sex;

  User({
    this.userId,
    required this.userName,
    required this.dateOfBirth,
    required this.urlAvatar,
    required this.userPassword,
    required this.userFrom,
    required this.fullName,
    required this.sex,
  });

  User copy({
    int? userId,
    String? userName,
    String? dateOfBirth,
    String? urlAvatar,
    String? userPassword,
    String? userFrom,
    String? fullName,
    String? sex,
  }) =>
      User(
        userId: userId ?? this.userId,
        userName: userName ?? this.userName,
        dateOfBirth: dateOfBirth ?? this.dateOfBirth,
        urlAvatar: urlAvatar ?? this.urlAvatar,
        userPassword: userPassword ?? this.userPassword,
        userFrom: userFrom ?? this.userFrom,
        fullName: fullName ?? this.fullName,
        sex: sex ?? this.sex,
      );

  static User fromJson(Map<String, Object?> json) => User(
        userId: json[UserFields.userId] as int?,
        userName: json[UserFields.userName] as String,
        dateOfBirth: json[UserFields.dateOfBirth] as String,
        urlAvatar: json[UserFields.urlAvatar] as String,
        userPassword: json[UserFields.userPassword] as String,
        userFrom: json[UserFields.userFrom] as String,
        fullName: json[UserFields.fullName] as String,
        sex: json[UserFields.sex] as String,
      );

  Map<String, Object?> toJson() => {
        UserFields.userId: userId,
        UserFields.userName: userName,
        UserFields.dateOfBirth: dateOfBirth,
        UserFields.urlAvatar: urlAvatar,
        UserFields.userPassword: userPassword,
        UserFields.fullName: fullName,
        UserFields.userFrom: userFrom,
        UserFields.sex: sex,
      };
}

class UserFields {
  static final List<String> values = [
    /// Add all fields
    userId, userName, dateOfBirth, urlAvatar, userPassword, userFrom, fullName,
    sex
  ];

  static final String userId = 'userId';
  static final String userName = 'userName';
  static final String dateOfBirth = 'dateOfBirth';
  static final String urlAvatar = 'urlAvatar';
  static final String userPassword = 'userPassword';
  static final String userFrom = 'userFrom';
  static final String fullName = 'fullName';
  static final String sex = 'sex';
}

class loginToProfilePage {
  static int userId = 0;
  static late User user;
}

var user1 = User(
  userName: "nmluan.49@gmail.com",
  userPassword: "luan123",
  dateOfBirth: "1999-09-04",
  urlAvatar: "assets/images/example.jpg",
  fullName: "Nguyễn Minh Luân",
  sex: "Nam",
  userFrom: "Bà Rịa",
);

var user2 = User(
  userName: "abcxyz@gmail.com",
  userPassword: "vinh123",
  dateOfBirth: "2001-3-12",
  urlAvatar: "assets/images/blank_avatar.png",
  fullName: "Hồ Trọng Vinh",
  sex: "Nam",
  userFrom: "Vũng Tàu",
);
