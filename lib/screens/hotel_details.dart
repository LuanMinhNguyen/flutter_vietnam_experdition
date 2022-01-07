// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, unnecessary_this, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_vietnam_experdition/db/database.dart';
import 'package:flutter_vietnam_experdition/models/hotel.dart';

class HotelDetails extends StatefulWidget {
  final int hotelId;
  final Hotel hotel;

  const HotelDetails({
    Key? key,
    required this.hotelId,
    required this.hotel,
  }) : super(key: key);

  @override
  _HotelDetailsState createState() => _HotelDetailsState();
}

class _HotelDetailsState extends State<HotelDetails> {
  late Hotel hotel;

  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    refreshHotel();
  }

  Future refreshHotel() async {
    setState(() => isLoading = true);

    this.hotel = await VNEdatabase.instance.readHotel(widget.hotelId);

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
                      color: Colors.black26,
                      offset: Offset(0, 2),
                      blurRadius: 6,
                    ),
                  ],
                ),
                child: Hero(
                  tag: widget.hotel.hotelUrlImage,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    child: Image(
                      image: AssetImage(widget.hotel.hotelUrlImage),
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
                      widget.hotel.hotelName,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.5,
                      ),
                      maxLines: 2,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          size: 16,
                          color: Colors.white,
                        ),
                        Text(
                          widget.hotel.hotelLocation,
                          style: TextStyle(
                            color: Colors.white,
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
          Padding(
            padding: EdgeInsets.all(10),
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.location_city_rounded,
                            size: 24,
                            color: Color(0xffdaa520),
                          ),
                          Text(
                            ' Địa chỉ: ',
                            style: TextStyle(
                              fontSize: 20,
                              color: Color(0xffdaa520),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.48,
                        child: Text(
                          widget.hotel.hotelAddress,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.work_rounded,
                            size: 24,
                            color: Color(0xffdaa520),
                          ),
                          Text(
                            ' Giờ làm việc: ',
                            style: TextStyle(
                              fontSize: 20,
                              color: Color(0xffdaa520),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.48,
                        child: Text(
                          widget.hotel.startTime == widget.hotel.endTime
                              ? 'Cả ngày'
                              : widget.hotel.startTime +
                                  ' - ' +
                                  widget.hotel.endTime,
                          style: TextStyle(
                            fontSize: 16,
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
    );
  }
}
