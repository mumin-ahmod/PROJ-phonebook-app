import 'package:flutter/material.dart';
import 'package:phonebook_murad/ui/add_number.dart';
import 'package:phonebook_murad/ui/build_numbers_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Murad's Phonebook", style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,

        actions: const [
          Icon(Icons.refresh),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => AddNumber())); }, child: const Icon(Icons.add),),

      body: BuildNumbersList(),
    );
  }
}

