


import 'package:get/get.dart';
import 'package:phonebook_murad/data/number_model.dart';
import 'package:phonebook_murad/data/sqlite_database_helper.dart';

class NumberController extends GetxController{

  var numberList = <Number>[].obs;



  @override
  void onInit() {


    _getData();
    super.onInit();
  }

  void _getData() {
    DatabaseHelper.getAllNumbers().then((value) =>
        value.forEach((element) =>
            numberList.add(Number(id: element.id, name: element.name, phoneNumber: element.phoneNumber, email: element.email))));
  }


  void addData(Number number) async {
    DatabaseHelper.insertNumber(number.toMap());

    numberList.insert(0,
        Number(id: numberList.length, phoneNumber: number.phoneNumber, name: number.name, email: number.email));

  }

}