import 'package:crud_project/src/screen/credit/home/credit_home_blog.dart';
import 'package:crud_project/src/screen/credit/home/credit_home_page.dart';
import 'package:crud_project/src/screen/credit/home/credit_register_page.dart';
import 'package:crud_project/src/screen/entry/entry/entrypage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CreditHomeBLoC(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        initialRoute: "/",
        routes: {
          "/": (context) => EntryPage(),
          "/CreditHome": (context) => CreditHomePage(),
          "/CreditRegistro": (context) => CreditRegisterPage()
        },
      ),
    );
  }
}
