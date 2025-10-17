import 'package:sqflite/sqflite.dart';
import '../manger/model.dart';

Database? database;

Future<void> createDatabase() async {
  database = await openDatabase(
    'todo.db',
    version: 1,
    onCreate: (db, version) async {
      await db.execute(
          'CREATE TABLE Test (id INTEGER PRIMARY KEY, title TEXT, data TEXT, time TEXT, status TEXT)'
      );
      print('Database created');
    },
    onOpen: (db) {
      print('Database opened');
    },
  );
}

Future<void> insertValue(Data task) async {
  await database!.insert(
    'Test',
    task.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
  print('Task inserted: ${task.title}');
}

Future<List<Data>> getData() async {
  final List<Map<String, dynamic>> maps = await database!.query('Test');
  return List.generate(maps.length, (i) => Data.fromMap(maps[i]));
}