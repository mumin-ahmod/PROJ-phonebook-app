
import 'package:phonebook_murad/data/sqlite_database_helper.dart';

class Number{

  int? id;
  String? name;
  int? phoneNumber;
  String? email;

  Number({this.id, this.name, this.phoneNumber, this.email});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic> {

      DatabaseHelper.nameTable.toString(): name,
      DatabaseHelper.numberTable.toString(): phoneNumber,
      DatabaseHelper.emailTable.toString(): email

    };
    if(id!=null){
      map[DatabaseHelper.idTable] = id;
    }



    return map;



  }

  static Number fromMap(Map<String, dynamic> map){

    return Number(
      id: map[DatabaseHelper.idTable],
      name: map[DatabaseHelper.nameTable],
      phoneNumber: map[DatabaseHelper.numberTable],
      email: map[DatabaseHelper.emailTable]
    );

  }

  



}