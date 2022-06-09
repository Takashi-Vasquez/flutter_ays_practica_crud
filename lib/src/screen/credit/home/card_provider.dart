import 'dart:convert';

import 'package:crud_project/src/models/card_models.dart';
import 'package:http/http.dart' as http;

class CardRepositoty {
  static var client = http.Client();
  String URL_BASE = "creditcard-function.azurewebsites.net";

  Future<List<CardModel>> listCard() async {
    List<CardModel> cardList = [];
    try {
      Map<String, String> queryString = {};
      //https://creditcard-function.azurewebsites.net/api/getCreditCards?nacionalidad=Portugal&menores=35
      //queryString["Nacionalidad"] = "Portugal";

      var url = Uri.https(URL_BASE, "/api/getCreditCards", queryString);
      String token = "sgtsrgrtsbrgfsrfa58rgare8f1asfsgaf8af15arfs88";
      Map<String, String> requestHeaders = {
        //"authorization": "Bearer $token",
      };
      var response = await client.get(url, headers: requestHeaders);

      cardList =
          cardModelFromJson(response.body); //se obtiene el cuerpo de string
    } catch (e) {
      print(e);
    }

    return cardList;
  }

  Future<bool> registerCard(CardModel model) async {
    bool registered = false;

    try {
      Map<String, String> queryString = {};
      //https://creditcard-function.azurewebsites.net/api/getCreditCards?nacionalidad=Portugal&menores=35
      //queryString["Nacionalidad"] = "Portugal";

      var url = Uri.https(URL_BASE, "/api/createCreditCard", queryString);
      String token = "sgtsrgrtsbrgfsrfa58rgare8f1asfsgaf8af15arfs88";
      Map<String, String> requestHeaders = {
        //"authorization": "Bearer $token",
      };
      var response = await client.post(url,
          body: jsonEncode(model.toJson()), headers: requestHeaders);
      if (response.statusCode == 201) {
        registered = true;
      }
    } catch (e) {
      print(e);
    }

    return registered;
  }
}
