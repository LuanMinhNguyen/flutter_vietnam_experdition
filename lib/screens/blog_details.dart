// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, unnecessary_this, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_vietnam_experdition/db/database.dart';
import 'package:flutter_vietnam_experdition/models/blog.dart';
import 'package:flutter_vietnam_experdition/models/hotel.dart';
import 'package:flutter_vietnam_experdition/models/user.dart';
import 'package:flutter_vietnam_experdition/screens/hotel_details.dart';

class BlogDetails extends StatefulWidget {
  final int blogId;
  final String location;
  final Blog blog;

  const BlogDetails({
    Key? key,
    required this.blogId,
    required this.location,
    required this.blog,
  }) : super(key: key);

  @override
  _BlogDetailsState createState() => _BlogDetailsState();
}

class _BlogDetailsState extends State<BlogDetails> {
  late Blog blog;
  List<Hotel> sugestionHotels = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    refreshBlog();
  }

  Future refreshBlog() async {
    setState(() => isLoading = true);

    this.blog = await VNEdatabase.instance.readBlog(widget.blogId);
    this.sugestionHotels =
        await VNEdatabase.instance.readHotelsWithLocation(widget.location);

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe8e8e8),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.width * 0.6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black45,
                      offset: Offset(0, 2),
                      blurRadius: 6,
                    ),
                  ],
                ),
                child: Hero(
                  tag: widget.blog.urlImage,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    child: Image(
                      image: AssetImage(widget.blog.urlImage),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(Icons.arrow_back_ios_new_rounded),
                      iconSize: 30,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 20,
                bottom: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.blog.blogName,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          size: 16,
                          color: Colors.white,
                        ),
                        Text(
                          widget.blog.location,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 20,
                bottom: 20,
                child: Icon(
                  Icons.favorite_rounded,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            widget.blog.blogTitle,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 2,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Tác giả: ',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          widget.blog.userName,
                          style: TextStyle(
                            color: Color(0xffdaa520),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          widget.blog.postTime.day.toString() +
                              '/' +
                              widget.blog.postTime.month.toString() +
                              '/' +
                              widget.blog.postTime.year.toString(),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 30),
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Divider(
                        color: Color(0xffe8e8e8),
                        thickness: 1.5,
                      ),
                    ),
                    sugestionHotels.isNotEmpty
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Khách sạn đề xuất',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 10),
                                height: 300,
                                child: ListView.builder(
                                    physics: BouncingScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    itemCount: sugestionHotels.length,
                                    itemBuilder: (context, index) {
                                      final _sugestionHotels =
                                          sugestionHotels[index];
                                      return GestureDetector(
                                        onTap: () async {
                                          await Navigator.of(context)
                                              .push(MaterialPageRoute(
                                            builder: (context) => HotelDetails(
                                              hotelId:
                                                  _sugestionHotels.hotelId!,
                                              hotel: _sugestionHotels,
                                            ),
                                          ));
                                        },
                                        child: Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 5),
                                          padding: EdgeInsets.symmetric(
                                              vertical: 10),
                                          width: 210,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            color: Color(0xffe8e8e8),
                                          ),
                                          child: Stack(
                                            alignment: Alignment.topCenter,
                                            children: <Widget>[
                                              Positioned(
                                                bottom: 15.0,
                                                child: Container(
                                                  height: 120,
                                                  width: 200,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 10),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: <Widget>[
                                                        Text(
                                                          _sugestionHotels
                                                              .hotelName,
                                                          maxLines: 2,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                        Text(
                                                          _sugestionHotels
                                                                      .startTime ==
                                                                  _sugestionHotels
                                                                      .endTime
                                                              ? 'Cả ngày'
                                                              : _sugestionHotels
                                                                      .startTime
                                                                      .toUpperCase() +
                                                                  ' - ' +
                                                                  _sugestionHotels
                                                                      .endTime
                                                                      .toUpperCase(),
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: Color(
                                                                0xffdaa520),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.black45,
                                                      offset: Offset(0, 2),
                                                      blurRadius: 6,
                                                    ),
                                                  ],
                                                ),
                                                child: Stack(
                                                  children: <Widget>[
                                                    Hero(
                                                      tag: _sugestionHotels
                                                          .hotelUrlImage,
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                        child: Image(
                                                          height: 180,
                                                          width: 180,
                                                          image: AssetImage(
                                                              _sugestionHotels
                                                                  .hotelUrlImage),
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    }),
                              ),
                            ],
                          )
                        : Text(
                            'Không có khách sạn nào được đề xuất.',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 30),
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Divider(
                        color: Color(0xffe8e8e8),
                        thickness: 1.5,
                      ),
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Nội dung',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                widget.blog.blogContent,
                                textAlign: TextAlign.justify,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
