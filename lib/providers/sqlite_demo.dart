import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:todoapp/model/task.dart';

class SQLiteHelper {
  Future<Database> init() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'todo_db.db'),
      version: 1,
    );
  }

  void createTable() async {
    var db = await init();
    db
        .execute(
            'CREATE TABLE IF NOT EXISTS tasks (id INTEGER PRIMARY KEY, title TEXT, description TEXT)')
        .then((res) {
      print("CREATED");
    }).catchError((e) {
      print(e);
    });
  }

  void insertData(Task task) async {
    var db = await init();
    await db.insert(
      'tasks',
      task.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  readData() async {
    var db = await init();
    final List<Map<String, dynamic>> maps = await db.query('tasks');
    return List.generate(maps.length, (i) {
      print(maps[i]['title']);
      // return Task(
      //   id: maps[i]['id'],
      //   title: maps[i]['title'],
      //   description: maps[i]['description'],
      // );
    });
  }
}
