import 'dart:convert';
import 'dart:developer';

import '../model/apimodel.dart';
import 'package:http/http.dart' as http;

class Apihelper {
  Apihelper._();

  static Apihelper newsHelper = Apihelper._();

  Future<List<Apimodel>?> ApiData() async {
    String Apikey = "d8d131503887483184f41033278f84b6";
    String hostname = "https://newsapi.org";
    String link = "$hostname/v2/top-headlines/sources?apiKey=$Apikey";

    http.Response response = await http.get(Uri.parse(link));

    if (response.statusCode == 200) {
      var decodeData = jsonDecode(response.body);

      log("DecodeData: $decodeData");

      List NewsData = decodeData['sources'];

      log("News: $NewsData");

      List<Apimodel> NewsDataList = NewsData.map(
        (e) => Apimodel.fromjson(e),
      ).toList();

      return NewsDataList;
    } else {
      return null;
    }
  }

  headline() async {
    String link =
        "https://newsapi.org/v2/top-headlines?country=us&apiKey=d8d131503887483184f41033278f84b6";

    http.Response response = await http.get(Uri.parse(link));

    if (response.statusCode == 200) {
      var decodeData = jsonDecode(response.body);

      log("DecodeData: $decodeData");

      List NewsData = decodeData['articles'];

      log("News: $NewsData");

      List<Apimodel> apidetails =
          NewsData.map((e) => Apimodel.fromjson(e)).toList();

      return apidetails;
    } else {
      return null;
    }
  }
}
