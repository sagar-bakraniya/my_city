import 'dart:convert' as convert;
import 'dart:convert';

import 'package:http/http.dart' as http;

var url =
    'https://my-city-server-vercel-migration.vercel.app/api/v1/record/recentRecords';

Future<ReportsResponse> fetchAlbum() async {
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    // Iterable l = json.decode(response.body);
    // List<Autogenerated> posts = List<Autogenerated>.from(
    //     l.map((model) => Autogenerated.fromJson(model)));
    // print(l);
    return ReportsResponse.fromJson(jsonDecode(response.body));
    // return posts;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class ReportsResponse {
  late bool success;
  late int nHbits;
  late List<Data> data;

  ReportsResponse(
      {required this.success, required this.nHbits, required this.data});

  ReportsResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    nHbits = json['nHbits'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['nHbits'] = this.nHbits;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  late String sId;
  late String address;
  late String location;
  late String date;
  late String time;
  late bool isOpen;
  late String description;
  late String userId;
  late String category;
  late String subCategory;
  late String imgUrl;
  late bool isPending;
  late int iV;

  Data(
      {required this.sId,
      required this.address,
      required this.location,
      required this.date,
      required this.time,
      required this.isOpen,
      required this.description,
      required this.userId,
      required this.category,
      required this.subCategory,
      required this.imgUrl,
      required this.isPending,
      required this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    address = json['address'];
    location = json['location'];
    date = json['date'];
    time = json['time'];
    isOpen = json['isOpen'];
    description = json['description'];
    userId = json['userId'];
    category = json['category'];
    subCategory = json['subCategory'];
    imgUrl = json['imgUrl'];
    isPending = json['isPending'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['address'] = this.address;
    data['location'] = this.location;
    data['date'] = this.date;
    data['time'] = this.time;
    data['isOpen'] = this.isOpen;
    data['description'] = this.description;
    data['userId'] = this.userId;
    data['category'] = this.category;
    data['subCategory'] = this.subCategory;
    data['imgUrl'] = this.imgUrl;
    data['isPending'] = this.isPending;
    data['__v'] = this.iV;
    return data;
  }
}
