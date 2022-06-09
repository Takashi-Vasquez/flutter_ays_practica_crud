import 'package:crud_project/src/models/card_models.dart';
import 'package:crud_project/src/screen/credit/home/credit_home_blog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreditHomePage extends StatefulWidget {
  const CreditHomePage({Key? key}) : super(key: key);

  @override
  State<CreditHomePage> createState() => _CreditHomePageState();
}

class _CreditHomePageState extends State<CreditHomePage> {
  late CreditHomeBLoC creditHomeBLoC;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    creditHomeBLoC = Provider.of<CreditHomeBLoC>(context, listen: false);
    creditHomeBLoC.listCard();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Credit Cards"),
      ),
      body: Column(
        children: [
          widgetTitle(),
          widgetList(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //creditHomeBLoC.addCard();
          Navigator.of(context).pushNamed("/CreditRegistro");
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Container widgetTitle() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: const [
          Icon(
            Icons.credit_card,
            color: Colors.purple,
          ),
          SizedBox(width: 10),
          Text(
            "Card List",
            style: TextStyle(fontSize: 17),
          )
        ],
      ),
    );
  }

  Widget widgetList() {
    return Consumer<CreditHomeBLoC>(
        builder: (BuildContext context, provider, Widget? child) {
      return Expanded(
        child: ListView.builder(
          itemCount: provider.cardList.length,
          itemBuilder: (BuildContext context, int index) {
            return widgerItemList(provider.cardList[index]);
          },
        ),
      );
    });
  }
  // Widget widgetList() {
  //   return Expanded(
  //     child: ListView(
  //       children: [
  //         widgerItemList(),
  //         widgerItemList(),
  //         widgerItemList(),
  //         widgerItemList(),
  //       ],
  //     ),
  //   );
  // }

  widgerItemList(CardModel model) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.cardHolder,
                style: TextStyle(color: Colors.black, fontSize: 17),
              ),
              Text(
                model.cardNumber,
                style: TextStyle(color: Colors.grey, fontSize: 15),
              ),
            ],
          )),
          Icon(
            Icons.chevron_right,
            color: Colors.purple,
            size: 30,
          ),
        ],
      ),
    );
  }
/*
  widgerItemList() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text("1111111111"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Carlos Perez"),
                ],
              ),
            ],
          )),
          Icon(
            Icons.chevron_right,
            color: Colors.purple,
            size: 30,
          ),
        ],
      ),
    );
  }
  */
}
