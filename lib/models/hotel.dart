// ignore_for_file: camel_case_types, prefer_const_declarations, prefer_const_constructors, non_constant_identifier_names
final String tableHotels = 'hotels';

class Hotel {
  final int? hotelId;
  final String hotelName;
  final String hotelAddress;
  final String hotelUrlImage;
  final String startTime;
  final String endTime;
  final String hotelLocation;

  Hotel({
    this.hotelId,
    required this.hotelName,
    required this.hotelAddress,
    required this.hotelUrlImage,
    required this.startTime,
    required this.endTime,
    required this.hotelLocation,
  });

  Hotel copy({
    int? hotelId,
    String? hotelName,
    String? hotelAddress,
    String? hotelUrlImage,
    String? startTime,
    String? endTime,
    String? hotelLocation,
  }) =>
      Hotel(
        hotelId: hotelId ?? this.hotelId,
        hotelName: hotelName ?? this.hotelName,
        hotelAddress: hotelAddress ?? this.hotelAddress,
        hotelUrlImage: hotelUrlImage ?? this.hotelUrlImage,
        startTime: startTime ?? this.startTime,
        endTime: endTime ?? this.endTime,
        hotelLocation: hotelLocation ?? this.hotelLocation,
      );

  static Hotel fromJson(Map<String, Object?> json) => Hotel(
        hotelId: json[HotelFields.hotelId] as int?,
        hotelName: json[HotelFields.hotelName] as String,
        hotelAddress: json[HotelFields.hotelAddress] as String,
        hotelUrlImage: json[HotelFields.hotelUrlImage] as String,
        startTime: json[HotelFields.startTime] as String,
        endTime: json[HotelFields.endTime] as String,
        hotelLocation: json[HotelFields.hotelLocation] as String,
      );

  Map<String, Object?> toJson() => {
        HotelFields.hotelId: hotelId,
        HotelFields.hotelName: hotelName,
        HotelFields.hotelAddress: hotelAddress,
        HotelFields.hotelUrlImage: hotelUrlImage,
        HotelFields.startTime: startTime,
        HotelFields.endTime: endTime,
        HotelFields.hotelLocation: hotelLocation,
      };
}

class HotelFields {
  static final List<String> values = [
    /// Add all fields
    hotelId, hotelName, hotelAddress, hotelUrlImage, startTime, endTime,
    hotelLocation
  ];

  static final String hotelId = 'hotelId';
  static final String hotelName = 'hotelName';
  static final String hotelAddress = 'hotelAddress';
  static final String hotelUrlImage = 'hotelUrlImage';
  static final String startTime = 'startTime';
  static final String endTime = 'endTime';
  static final String hotelLocation = 'hotelLocation';
}

var rialto = Hotel(
  hotelName: "Rialto",
  hotelAddress: "Riva del Ferro, San Marco, 30124 Venice, Ý",
  hotelUrlImage: "assets/images/hotels/Rialto.jpg",
  startTime: "07:00 am",
  endTime: "23:00 pm",
  hotelLocation: "Ý",
);

var maxboutique = Hotel(
  hotelName: "Max Boutique",
  hotelAddress:
      "Đường Vườn Cam, Thành Phố Cao Bằng, Việt Nam, Cao Bằng, Việt Nam",
  hotelUrlImage: "assets/images/hotels/MaxBoutique.jpg",
  startTime: "06:30 am",
  endTime: "22:30 pm",
  hotelLocation: "Việt Nam",
);

var midtownluxury = Hotel(
  hotelName: "Midtown Luxury",
  hotelAddress: "Calle Bruc 55., Eixample, 08009 Barcelona, Tây Ban Nha",
  hotelUrlImage: "assets/images/hotels/MidtownLuxuryApartments.jpg",
  startTime: "00:00 am",
  endTime: "00:00 am",
  hotelLocation: "Tây Ban Nha",
);

var CaBonfadiniHistoricExperience = Hotel(
  hotelName: "Ca' Bonfadini Historic",
  hotelAddress: "Fondamenta Savorgnan 461-462, Cannaregio, 30121 Venice, Ý",
  hotelUrlImage: "assets/images/hotels/Ca'BonfadiniHistoricExperience.jpg",
  startTime: "00:00 am",
  endTime: "00:00 am",
  hotelLocation: "Ý",
);

var MandysPalace = Hotel(
  hotelName: "Mandy's Palace Canal",
  hotelAddress: "2917 Calle Vitturi o Falier, San Marco, 30124 Venice, Ý",
  hotelUrlImage: "assets/images/hotels/Mandy'sPalace.jpg",
  startTime: "08:00 am",
  endTime: "11:00 pm",
  hotelLocation: "Ý",
);
