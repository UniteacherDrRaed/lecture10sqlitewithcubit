import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqliteDatabase {
  static Future<Database> sqlitedatabase() async {
    return await openDatabase(
        join(await getDatabasesPath(), "studentsforapp.db"),
        version: 1, onCreate: (Database db, int version) async {
      await db.execute('''
           CREATE TABLE students (id INTEGER PRIMARY KEY,
            name TEXT, course TEXT)
          ''');
    });
  }
}
