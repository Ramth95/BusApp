// To parse this JSON data, do
//
//     final assignDriver = assignDriverFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

AssignDriver assignDriverFromJson(String str) => AssignDriver.fromJson(json.decode(str));

String assignDriverToJson(AssignDriver data) => json.encode(data.toJson());

class AssignDriver {
    AssignDriver({
        required this.driverId,
        required this.busId,
    });

    String driverId;
    String busId;

    factory AssignDriver.fromJson(Map<String, dynamic> json) => AssignDriver(
        driverId: json["driver_id"],
        busId: json["bus_id"],
    );

    Map<String, dynamic> toJson() => {
        "driver_id": driverId,
        "bus_id": busId,
    };
}
