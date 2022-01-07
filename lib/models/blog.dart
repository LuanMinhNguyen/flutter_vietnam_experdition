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
  blogTitle: "Thành phố mộng mơ",
  postTime: DateTime.now(),
  blogContent:
      "Toạ lạc ở phía Đông Bắc của Italia bên bờ biển Adriatique là một xứ sở với tên gọi Venice (Venezia theo tiếng địa phương) mang nét đẹp thanh bình và lãng mạn. Venice – cái tên bắt nguồn từ người Veneti cổ sống vào khoảng thế kỷ 10 TCN còn có nghĩa là tình yêu. Vì vậy, quả không sai khi nơi đây được mệnh danh là thành phố tình yêu. Không chỉ có thế, Venice còn được người ta ưu ái gọi bởi những cái tên độc đáo như thành phố của những cây cầu, thành phố nổi cùng những chuyến thưởng ngoạn trên sông, thành phố của nghệ thuật thổi thuỷ tinh bậc nhất,…Tất cả những yếu tố thẩm mỹ ấy đã tạo nên một Venice có một không hai trên thế giới.",
  urlImage: "assets/images/blogs/Venice.jpg",
  location: "Ý",
  userName: "Nguyễn Minh Luân",
);

var caobang = Blog(
  blogName: "Cao Bằng",
  blogTitle: "Cảnh đẹp kỳ vĩ",
  postTime: DateTime.now(),
  blogContent:
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc auctor facilisis arcu, vitae aliquam enim maximus ac. Donec consectetur ante sit amet placerat fringilla. Nulla finibus dui id urna vulputate volutpat. Pellentesque sodales, orci vitae consectetur sagittis, ante sapien elementum massa, sit amet dignissim quam quam at eros. Nunc nec nibh dapibus, porta est in, imperdiet sem. Ut rhoncus scelerisque nibh, non cursus ipsum fermentum in. Phasellus non erat quis leo faucibus vehicula. Maecenas id dapibus ante. Vestibulum tristique nulla sit amet laoreet dapibus. Nunc nec augue ullamcorper, tempor odio quis, pretium nunc. Curabitur tortor sem, mattis ut nisl et, luctus suscipit nibh. In in tortor felis. Proin dignissim arcu ut ante pretium ultricies. Nulla cursus, risus in vestibulum feugiat, ligula velit aliquet neque, et porta ex arcu in sem.",
  urlImage: "assets/images/blogs/CaoBang.jpg",
  location: "Việt Nam",
  userName: "Đình Nhật",
);

var sydney = Blog(
  blogName: "Sydney",
  blogTitle: "Thủ đô nước Úc",
  postTime: DateTime.now(),
  blogContent:
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc auctor facilisis arcu, vitae aliquam enim maximus ac. Donec consectetur ante sit amet placerat fringilla. Nulla finibus dui id urna vulputate volutpat. Pellentesque sodales, orci vitae consectetur sagittis, ante sapien elementum massa, sit amet dignissim quam quam at eros. Nunc nec nibh dapibus, porta est in, imperdiet sem. Ut rhoncus scelerisque nibh, non cursus ipsum fermentum in. Phasellus non erat quis leo faucibus vehicula. Maecenas id dapibus ante. Vestibulum tristique nulla sit amet laoreet dapibus. Nunc nec augue ullamcorper, tempor odio quis, pretium nunc. Curabitur tortor sem, mattis ut nisl et, luctus suscipit nibh. In in tortor felis. Proin dignissim arcu ut ante pretium ultricies. Nulla cursus, risus in vestibulum feugiat, ligula velit aliquet neque, et porta ex arcu in sem.",
  urlImage: "assets/images/blogs/Sydney.jpg",
  location: "Úc",
  userName: "Phạm Khương",
);

var athens = Blog(
  blogName: "Athens",
  blogTitle: "Phố cổ 'Athína'",
  postTime: DateTime.now(),
  blogContent:
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc auctor facilisis arcu, vitae aliquam enim maximus ac. Donec consectetur ante sit amet placerat fringilla. Nulla finibus dui id urna vulputate volutpat. Pellentesque sodales, orci vitae consectetur sagittis, ante sapien elementum massa, sit amet dignissim quam quam at eros. Nunc nec nibh dapibus, porta est in, imperdiet sem. Ut rhoncus scelerisque nibh, non cursus ipsum fermentum in. Phasellus non erat quis leo faucibus vehicula. Maecenas id dapibus ante. Vestibulum tristique nulla sit amet laoreet dapibus. Nunc nec augue ullamcorper, tempor odio quis, pretium nunc. Curabitur tortor sem, mattis ut nisl et, luctus suscipit nibh. In in tortor felis. Proin dignissim arcu ut ante pretium ultricies. Nulla cursus, risus in vestibulum feugiat, ligula velit aliquet neque, et porta ex arcu in sem.",
  urlImage: "assets/images/blogs/Athens.jpg",
  location: "Hi Lạp",
  userName: "Nguyễn Hòa",
);

var barcelona = Blog(
  blogName: "Barcelona",
  blogTitle: "Thủ phủ Catalonia",
  postTime: DateTime.now(),
  blogContent:
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc auctor facilisis arcu, vitae aliquam enim maximus ac. Donec consectetur ante sit amet placerat fringilla. Nulla finibus dui id urna vulputate volutpat. Pellentesque sodales, orci vitae consectetur sagittis, ante sapien elementum massa, sit amet dignissim quam quam at eros. Nunc nec nibh dapibus, porta est in, imperdiet sem. Ut rhoncus scelerisque nibh, non cursus ipsum fermentum in. Phasellus non erat quis leo faucibus vehicula. Maecenas id dapibus ante. Vestibulum tristique nulla sit amet laoreet dapibus. Nunc nec augue ullamcorper, tempor odio quis, pretium nunc. Curabitur tortor sem, mattis ut nisl et, luctus suscipit nibh. In in tortor felis. Proin dignissim arcu ut ante pretium ultricies. Nulla cursus, risus in vestibulum feugiat, ligula velit aliquet neque, et porta ex arcu in sem.",
  urlImage: "assets/images/blogs/Barcelona.jpg",
  location: "Tây Ban Nha",
  userName: "Nguyễn Minh Luân",
);
