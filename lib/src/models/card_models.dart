import 'dart:convert';

//una lista a partir de un JSON
List<CardModel> cardModelFromJson(String str) =>
    List<CardModel>.from(json.decode(str).map((x) => CardModel.fromJson(x)));

//Convierte una lista  JSON a partir de un objeto
String cardModelToJson(List<CardModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CardModel {
  String id;
  String cardHolder;
  String cardNumber;
  String expirationDate;
  String cvv;

  CardModel({
    required this.id,
    required this.cardHolder,
    required this.cardNumber,
    required this.expirationDate,
    required this.cvv,
  });
  //convertir un JSON a objeto
  factory CardModel.fromJson(Map<String, dynamic> json) => CardModel(
        id: json["id"],
        cardHolder: json["cardHolder"],
        cardNumber: json["cardNumber"],
        expirationDate: json["expirationDate"],
        cvv: json["cvv"],
      );
  //lo convierte objeto en un JSON
  Map<String, dynamic> toJson() => {
        "id": id,
        "cardHolder": cardHolder,
        "cardNumber": cardNumber,
        "expirationDate": expirationDate,
        "cvv": cvv,
      };
}
