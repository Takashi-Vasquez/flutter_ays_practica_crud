import 'package:crud_project/src/screen/credit/home/credit_home_page.dart';
import 'package:crud_project/src/screen/entry/splash/splashpage.dart';
import 'package:flutter/material.dart';

class EntryPage extends StatefulWidget {
  @override
  State<EntryPage> createState() => _EntryPageState();
}

class _EntryPageState extends State<EntryPage> {
  bool authFinished = false;
  bool islogger = false;

  void autenticate() {
    Future.delayed(
      Duration(seconds: 3),
      () {
        setState(() {
          authFinished = true;
          islogger = true;
        });
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    autenticate();
  }

  @override
  Widget build(BuildContext context) {
    return authFinished == true
        ? islogger == true
            ? CreditHomePage()
            : const Scaffold(
                body: Center(child: Text("estoy en el login")),
              )
        : SplashPage();
  }
}
