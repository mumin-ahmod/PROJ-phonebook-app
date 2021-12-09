import 'package:flutter/material.dart';
import 'package:phonebook_murad/controller/number_controller.dart';
import 'package:phonebook_murad/data/number_model.dart';
import 'package:phonebook_murad/data/sqlite_database_helper.dart';
import 'package:phonebook_murad/ui/home_page.dart';
import 'package:get/get.dart';

class AddNumber extends StatelessWidget {
  AddNumber({Key? key}) : super(key: key);




  final GlobalKey<FormState> _key = GlobalKey();

  String? name;
  int? phone;
  String? email;

  DatabaseHelper databaseHelper = DatabaseHelper();

  final NumberController numberController = Get.put(NumberController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add New Number",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Form(
        key: _key,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                decoration: const InputDecoration(
                    labelText: "Name", border: OutlineInputBorder()),
                onSaved: (value) {
                  name = value;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                decoration: const InputDecoration(
                    labelText: "Phone Number", border: OutlineInputBorder()),
                onSaved: (value) {
                  phone = int.parse(value!);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                decoration: const InputDecoration(
                    labelText: "Email", border: OutlineInputBorder()),
                onSaved: (value) {
                  email = value;
                },
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            ElevatedButton(
              onPressed: () async {
                _key.currentState!.save();

                var number = Number(
                  name: name,
                  phoneNumber: phone,
                  email: email,
                );
                numberController.addData(number);

                Navigator.pop(context);
              },
              child: const Text("Save"),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 40),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
