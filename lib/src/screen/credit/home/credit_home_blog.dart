import 'package:crud_project/src/models/card_models.dart';
import 'package:crud_project/src/screen/credit/home/card_provider.dart';
import 'package:flutter/material.dart';

class CreditHomeBLoC extends ChangeNotifier {
  List<CardModel> cardList = [];
  CardRepositoty cardRepositoty = CardRepositoty();

  void addCard() {
    CardModel card = CardModel(
        id: "1",
        cardHolder: "Hugo Takashi",
        cardNumber: "111111111",
        expirationDate: "24/05",
        cvv: "555");
    cardList.add(card);
    notifyListeners();
  }

  Future<void> listCard() async {
    try {
      cardList = await cardRepositoty.listCard();
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<bool> registerCard(CardModel model) async {
    bool isRegister = false;
    try {
      isRegister = await cardRepositoty.registerCard(model);
      listCard();
    } catch (e) {
      print(e);
    }
    return isRegister;
  }
}
