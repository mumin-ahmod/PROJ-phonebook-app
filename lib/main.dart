import 'package:flutter/material.dart';
import 'package:phonebook_murad/ui/home_page.dart';

void main() {
  runApp(const PhonebookApp());
}

class PhonebookApp extends StatelessWidget {
  const PhonebookApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.purple,
      ),
      home: HomePage(),
    );
  }
}
