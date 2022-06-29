// To parse this JSON data, do
//
//     final busModelList = busModelListFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

BusModelList busModelListFromJson(String str) => BusModelList.fromJson(json.decode(str));

String busModelListToJson(BusModelList data) => json.encode(data.toJson());

class BusModelList {
    BusModelList({
        required this.status,
        required this.busList,
    });

    bool status;
    List<BusList> busList;

    factory BusModelList.fromJson(Map<String, dynamic> json) => BusModelList(
        status: json["status"],
        busList: List<BusList>.from(json["bus_list"].map((x) => BusList.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "bus_list": List<dynamic>.from(busList.map((x) => x.toJson())),
    };
}

class BusList {
    BusList({
        required this.id,
        required this.name,
        required this.image,
        required this.seatCount,
        required this.type,
        required this.driver,
    });

    int id;
    String name;
    String image;
    String seatCount;
    String type;
    dynamic driver;

    factory BusList.fromJson(Map<String, dynamic> json) => BusList(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        seatCount: json["seat_count"],
        type: json["type"],
        driver: json["driver"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "seat_count": seatCount,
        "type": type,
        "driver": driver,
    };
}
