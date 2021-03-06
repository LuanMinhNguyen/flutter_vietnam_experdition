// ignore_for_file: prefer_const_declarations
final String tableBlogs = 'blogs';

class Blog {
  final int? id;
  final String blogName;
  final String blogTitle;
  final DateTime postTime;
  final String blogContent;
  final String urlImage;
  final String location;
  final String userName;

  const Blog({
    this.id,
    required this.blogName,
    required this.blogTitle,
    required this.postTime,
    required this.blogContent,
    required this.urlImage,
    required this.location,
    required this.userName,
  });

  Blog copy({
    int? id,
    String? blogName,
    String? blogTitle,
    DateTime? postTime,
    String? blogContent,
    String? urlImage,
    String? location,
    String? userName,
  }) =>
      Blog(
        id: id ?? this.id,
        blogName: blogName ?? this.blogName,
        blogTitle: blogTitle ?? this.blogTitle,
        postTime: postTime ?? this.postTime,
        blogContent: blogContent ?? this.blogContent,
        urlImage: urlImage ?? this.urlImage,
        location: location ?? this.location,
        userName: userName ?? this.userName,
      );

  static Blog fromJson(Map<String, Object?> json) => Blog(
        id: json[BlogFields.id] as int?,
        blogName: json[BlogFields.blogName] as String,
        blogTitle: json[BlogFields.blogTitle] as String,
        postTime: DateTime.parse(json[BlogFields.postTime] as String),
        blogContent: json[BlogFields.blogContent] as String,
        urlImage: json[BlogFields.urlImage] as String,
        location: json[BlogFields.location] as String,
        userName: json[BlogFields.userName] as String,
      );

  Map<String, Object?> toJson() => {
        BlogFields.id: id,
        BlogFields.blogName: blogName,
        BlogFields.blogTitle: blogTitle,
        BlogFields.postTime: postTime.toIso8601String(),
        BlogFields.blogContent: blogContent,
        BlogFields.urlImage: urlImage,
        BlogFields.location: location,
        BlogFields.userName: userName,
      };
}

class BlogFields {
  static final List<String> values = [
    /// Add all fields
    id, blogName, blogTitle, postTime, blogContent, urlImage, location,
    userName,
  ];

  static final String id = 'id';
  static final String blogName = 'blogName';
  static final String blogTitle = 'blogTitle';
  static final String postTime = 'postTime';
  static final String blogContent = 'blogContent';
  static final String urlImage = 'urlImage';
  static final String location = 'location';
  static final String userName = 'userName';
}

var venice = Blog(
  blogName: "Venice",
  blogTitle: "Th??nh ph??? m???ng m??",
  postTime: DateTime.now(),
  blogContent:
      "To??? l???c ??? ph??a ????ng B???c c???a Italia b??n b??? bi???n Adriatique l?? m???t x??? s??? v???i t??n g???i Venice (Venezia theo ti???ng ?????a ph????ng) mang n??t ?????p thanh b??nh v?? l??ng m???n. Venice ??? c??i t??n b???t ngu???n t??? ng?????i Veneti c??? s???ng v??o kho???ng th??? k??? 10 TCN c??n c?? ngh??a l?? t??nh y??u. V?? v???y, qu??? kh??ng sai khi n??i ????y ???????c m???nh danh l?? th??nh ph??? t??nh y??u. Kh??ng ch??? c?? th???, Venice c??n ???????c ng?????i ta ??u ??i g???i b???i nh???ng c??i t??n ?????c ????o nh?? th??nh ph??? c???a nh???ng c??y c???u, th??nh ph??? n???i c??ng nh???ng chuy???n th?????ng ngo???n tr??n s??ng, th??nh ph??? c???a ngh??? thu???t th???i thu??? tinh b???c nh???t,???T???t c??? nh???ng y???u t??? th???m m??? ???y ???? t???o n??n m???t Venice c?? m???t kh??ng hai tr??n th??? gi???i.",
  urlImage: "assets/images/blogs/Venice.jpg",
  location: "??",
  userName: "Nguy???n Minh Lu??n",
);

var caobang = Blog(
  blogName: "Cao B???ng",
  blogTitle: "C???nh ?????p k??? v??",
  postTime: DateTime.now(),
  blogContent:
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc auctor facilisis arcu, vitae aliquam enim maximus ac. Donec consectetur ante sit amet placerat fringilla. Nulla finibus dui id urna vulputate volutpat. Pellentesque sodales, orci vitae consectetur sagittis, ante sapien elementum massa, sit amet dignissim quam quam at eros. Nunc nec nibh dapibus, porta est in, imperdiet sem. Ut rhoncus scelerisque nibh, non cursus ipsum fermentum in. Phasellus non erat quis leo faucibus vehicula. Maecenas id dapibus ante. Vestibulum tristique nulla sit amet laoreet dapibus. Nunc nec augue ullamcorper, tempor odio quis, pretium nunc. Curabitur tortor sem, mattis ut nisl et, luctus suscipit nibh. In in tortor felis. Proin dignissim arcu ut ante pretium ultricies. Nulla cursus, risus in vestibulum feugiat, ligula velit aliquet neque, et porta ex arcu in sem.",
  urlImage: "assets/images/blogs/CaoBang.jpg",
  location: "Vi???t Nam",
  userName: "????nh Nh???t",
);

var sydney = Blog(
  blogName: "Sydney",
  blogTitle: "Th??? ???? n?????c ??c",
  postTime: DateTime.now(),
  blogContent:
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc auctor facilisis arcu, vitae aliquam enim maximus ac. Donec consectetur ante sit amet placerat fringilla. Nulla finibus dui id urna vulputate volutpat. Pellentesque sodales, orci vitae consectetur sagittis, ante sapien elementum massa, sit amet dignissim quam quam at eros. Nunc nec nibh dapibus, porta est in, imperdiet sem. Ut rhoncus scelerisque nibh, non cursus ipsum fermentum in. Phasellus non erat quis leo faucibus vehicula. Maecenas id dapibus ante. Vestibulum tristique nulla sit amet laoreet dapibus. Nunc nec augue ullamcorper, tempor odio quis, pretium nunc. Curabitur tortor sem, mattis ut nisl et, luctus suscipit nibh. In in tortor felis. Proin dignissim arcu ut ante pretium ultricies. Nulla cursus, risus in vestibulum feugiat, ligula velit aliquet neque, et porta ex arcu in sem.",
  urlImage: "assets/images/blogs/Sydney.jpg",
  location: "??c",
  userName: "Ph???m Kh????ng",
);

var athens = Blog(
  blogName: "Athens",
  blogTitle: "Ph??? c??? 'Ath??na'",
  postTime: DateTime.now(),
  blogContent:
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc auctor facilisis arcu, vitae aliquam enim maximus ac. Donec consectetur ante sit amet placerat fringilla. Nulla finibus dui id urna vulputate volutpat. Pellentesque sodales, orci vitae consectetur sagittis, ante sapien elementum massa, sit amet dignissim quam quam at eros. Nunc nec nibh dapibus, porta est in, imperdiet sem. Ut rhoncus scelerisque nibh, non cursus ipsum fermentum in. Phasellus non erat quis leo faucibus vehicula. Maecenas id dapibus ante. Vestibulum tristique nulla sit amet laoreet dapibus. Nunc nec augue ullamcorper, tempor odio quis, pretium nunc. Curabitur tortor sem, mattis ut nisl et, luctus suscipit nibh. In in tortor felis. Proin dignissim arcu ut ante pretium ultricies. Nulla cursus, risus in vestibulum feugiat, ligula velit aliquet neque, et porta ex arcu in sem.",
  urlImage: "assets/images/blogs/Athens.jpg",
  location: "Hi L???p",
  userName: "Nguy???n H??a",
);

var barcelona = Blog(
  blogName: "Barcelona",
  blogTitle: "Th??? ph??? Catalonia",
  postTime: DateTime.now(),
  blogContent:
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc auctor facilisis arcu, vitae aliquam enim maximus ac. Donec consectetur ante sit amet placerat fringilla. Nulla finibus dui id urna vulputate volutpat. Pellentesque sodales, orci vitae consectetur sagittis, ante sapien elementum massa, sit amet dignissim quam quam at eros. Nunc nec nibh dapibus, porta est in, imperdiet sem. Ut rhoncus scelerisque nibh, non cursus ipsum fermentum in. Phasellus non erat quis leo faucibus vehicula. Maecenas id dapibus ante. Vestibulum tristique nulla sit amet laoreet dapibus. Nunc nec augue ullamcorper, tempor odio quis, pretium nunc. Curabitur tortor sem, mattis ut nisl et, luctus suscipit nibh. In in tortor felis. Proin dignissim arcu ut ante pretium ultricies. Nulla cursus, risus in vestibulum feugiat, ligula velit aliquet neque, et porta ex arcu in sem.",
  urlImage: "assets/images/blogs/Barcelona.jpg",
  location: "T??y Ban Nha",
  userName: "Nguy???n Minh Lu??n",
);
