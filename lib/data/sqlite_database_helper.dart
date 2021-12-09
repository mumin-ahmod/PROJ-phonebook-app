import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;
import 'number_model.dart';

class DatabaseHelper{

  static const tableName= 'myphonebook';
  static const databaseVersion = 1;


  static const idTable = 'id';
  static const nameTable = 'name';
  static const numberTable = 'number';
  static const emailTable = 'email';





  static Future _onCreate(Database db, int version){
    return db.execute("""CREATE TABLE $tableName(
        $idTable INTEGER PRIMARY KEY AUTOINCREMENT,
        $nameTable TEXT,
        $numberTable INTEGER,
        $emailTable TEXT)""") ;
  }

  static Future open() async {

    final rootPath = await getDatabasesPath();

    final dbPath = path.join(rootPath, 'MyPhonebook.db');

    print('my db opened');

    return openDatabase(dbPath, onCreate: _onCreate, version: databaseVersion);

  }

  static Future insertNumber(Map<String, dynamic> row) async {

    final db = await open();

    print('db inserted');
    return await db.insert(tableName,row, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<List<Number>> getAllNumbers() async {
    final db = await open();

    List<Map<String, dynamic>> mapList = await db.query(tableName);


    print("all numbers got");
    return List.generate(mapList.length, (index) => Number.fromMap(mapList[index]));




  }



}