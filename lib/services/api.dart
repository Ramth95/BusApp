import 'dart:convert';

import 'package:bus_test/Components/secureStorage.dart';
import 'package:bus_test/Components/urls.dart';
import 'package:bus_test/Models/UserModel.dart';
import 'package:bus_test/Models/assignModel.dart';
import 'package:bus_test/Models/busListModel.dart';
import 'package:bus_test/Models/driverListModel.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class DioClient {
  final Dio _dio = Dio();
  String? accesstoken;
  late String urlId;
  final SecureStorage secureStorage = SecureStorage();
  // refreshToken() {
  //   _dio.interceptors.add(InterceptorsWrapper(onError: ((e, handler){

  //   })));
  // }

  Future<User> login(String username, String password) async {
    var response = await _dio.post(
      BASE_URL + "LoginApi",
      data: json.encode({"username": username, "password": password}),
    );

    if (response.statusCode == 200) {
      var output = User.fromJson(response.data);
      accesstoken = output.access;
      secureStorage.writeSecureData('access', output.access);
      secureStorage.writeSecureData('url_id', output.urlId);
      // var value = json.encode(response.data);

      //print(value);
      return output;
    } else {
      throw Exception('Unable to login user.');
    }
  }

  Future<List<BusList>> list_bus() async {
    await Future.sync(
        () async => urlId = await secureStorage.readSecureData('url_id'));
    print(urlId);
    await Future.sync(
        () async => accesstoken = await secureStorage.readSecureData('access'));
    print(accesstoken);
    // Dio dio=Dio();
    _dio.options.headers["Authorization"] = "Bearer $accesstoken";
    String url = "http://flutter.noviindus.co.in/api/BusListApi/$urlId/";
    print(url);
    var response = await _dio.get(url

        //options: Options(headers: {"Bearer Token":accesstoken})

        //data: json.encode({"username": username, "password": password}),
        );
    print(url);

    print(response.statusCode);

    if (response.statusCode == 200) {
      var buslist = BusModelList.fromJson(response.data).busList;
      //var value = json.encode(response.data);
      //print(buslist);
      return buslist;
    } else {
      throw Exception('no data');
    }
  }

  Future<AssignDriver> assign_driver(String driver_id, String bus_id) async {
    await Future.sync(
        () async => urlId = await secureStorage.readSecureData('url_id'));
    print(urlId);
    await Future.sync(
        () async => accesstoken = await secureStorage.readSecureData('access'));
    print(accesstoken);
    // Dio dio=Dio();
    _dio.options.headers["Authorization"] = "Bearer $accesstoken";
    var response = await _dio.post(
      "http://flutter.noviindus.co.in/api/AssignDriverApi/$urlId/",
      //options: Options(headers: {"Bearer Token":accesstoken})
      data: json.encode({"driver_id": driver_id, "bus_id": bus_id}),
    );

    if (response.statusCode == 200) {
      var driver = AssignDriver.fromJson(response.data);
      //var value = json.encode(response.data);
      //print(buslist);
      return driver;
    } else {
      throw Exception('no data');
    }
  }

  Future<List<DriverListElement>> list_driver() async {
    await Future.sync(
        () async => urlId = await secureStorage.readSecureData('url_id'));
    print(urlId);
    await Future.sync(
        () async => accesstoken = await secureStorage.readSecureData('access'));
    print(accesstoken);
    // Dio dio=Dio();
    _dio.options.headers["Authorization"] = "Bearer $accesstoken";
    var response = await _dio.get(
      "http://flutter.noviindus.co.in/api/DriverApi/$urlId/",
      //options: Options(headers: {"Bearer Token":accesstoken})
      //data: json.encode({"driver_id": driver_id, "bus_id": bus_id}),
    );

    if (response.statusCode == 200) {
      var driverList = DriverList.fromJson(response.data).driverList;
      //var value = json.encode(response.data);
      //print(buslist);
      return driverList;
    } else {
      throw Exception('no data');
    }
  }
}
