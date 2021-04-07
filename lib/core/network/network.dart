import 'dart:async';
import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:mostadam_flutter/core/utils/Utilities.dart';

import 'api_constants.dart';
import 'network_error.dart';

enum ServerMethods { GET, POST, UPDATE, DELETE, PUT }
enum Environment { mock, initial, base }

class Network with NetworkError {
  static final Network shared = new Network._private();

  static String baseUrl = BASE_URL;

  Dio client = Dio();
  Environment _environment = Environment.initial;

  factory Network() {
    return shared;
  }

  Network._private() {
    client.options.connectTimeout = 120 * 1000;
    (client.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (_client) {
      _client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
    };
  }

  Future performRequest(String endpoint, Map<String, dynamic> parms,
      ServerMethods method,
      {Map<String, dynamic> putOrDeleteParams}) async {
    if (Utilities
        .getTokenHeader()
        .isNotEmpty) {
      Map<String, dynamic> queryParams = {};
      if (method == ServerMethods.GET) {
        queryParams = parms;
      } else if (method == ServerMethods.PUT ||
          method == ServerMethods.DELETE) {
        queryParams = putOrDeleteParams;
      }
      return _performRequest(endpoint,
          queryParms: queryParams,
          bodyParms: parms,
          method: method
              .toString()
              .split(".")
              .last);
    }
  }


  Future _performRequest(String endpoint,
      {Map<String, dynamic> bodyParms,
        Map<String, dynamic> queryParms,
        String method}) async {
    String headerToken =
    _environment != Environment.mock ? Utilities.getTokenHeader() : "";
    Map<String, dynamic> headers =
    headerToken == "" ? {} : {"Authorization": headerToken};
    print("headerToken " + headers.toString());
    try {
      print(method + '   ' + baseUrl + endpoint);
      Response response = await client.request(baseUrl + endpoint,
          // Response response = await client.request(getBaseUrl() + endpoint,
          data: bodyParms,
          queryParameters: queryParms,
          options: Options(method: method ?? "GET", headers: headers));
      print("$endpoint: $response");
      return response;
    } on SocketException catch (e) {
      throw {
        "code": 500,
        "error": ["لا يوجد اتصال بالانترنت"]
      };
    } catch (e) {
      print("$endpoint errorrrrrr $e");
      throw e.response.data;
    }
  }
}
