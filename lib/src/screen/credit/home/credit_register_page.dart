import 'package:crud_project/src/models/card_models.dart';
import 'package:crud_project/src/screen/credit/home/credit_home_blog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreditRegisterPage extends StatefulWidget {
  CreditRegisterPage({Key? key}) : super(key: key);

  @override
  State<CreditRegisterPage> createState() => _CreditRegisterPageState();
}

class _CreditRegisterPageState extends State<CreditRegisterPage> {
  final formkey = GlobalKey<FormState>();
  late CreditHomeBLoC creditHomeBLoC;
  late CardModel cardModel;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cardModel = CardModel(
        id: "", cardHolder: "", cardNumber: "", expirationDate: "", cvv: "");
    creditHomeBLoC = Provider.of<CreditHomeBLoC>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Card Register"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: "Card Holder"),
                  onSaved: (value) {
                    cardModel.cardHolder = value!;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(labelText: "Card Number"),
                  onSaved: (value) {
                    cardModel.cardNumber = value!;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "fill in the fill";
                    }
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(labelText: "Expiration Date"),
                  onSaved: (value) {
                    cardModel.expirationDate = value!;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(labelText: "CVV"),
                  onSaved: (value) {
                    cardModel.cvv = value!;
                  },
                ),
                SizedBox(height: 25),
                ElevatedButton.icon(
                  onPressed: () {
                    if (formkey.currentState!.validate()) {
                      formkey.currentState!.save();
                      registerCard(cardModel);
                      // print(cardModel.cardHolder);
                      // print(cardModel.cardNumber);
                      // print(cardModel.expirationDate);
                      // print(cardModel.cvv);
                      // print(" ");
                    }
                  },
                  icon: Icon(Icons.check),
                  label: Text("Save Card"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  registerCard(CardModel model) async {
    bool isRegister = await creditHomeBLoC.registerCard(model);
    if (isRegister) {
      Navigator.pop(context);
    }
  }
}
