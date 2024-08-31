import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
//to get inbuild path
import 'package:path_provider/path_provider.dart';

class DatabaseConnection {
  Future<Database> setDatabase() async {
    var directory = await getApplicationDocumentsDirectory();
    var path = join(directory.path, 'db_crud');

    /// there are three arguments are pass
    /// entha location la save pana poram
    /// antha database version enna
    /// enna database create pananum

    var database =
        await openDatabase(path, version: 1, onCreate: _createDatabase);
    return database;
  }

  Future<void> _createDatabase(Database database, int version) async {
    String sql =
        "CREATE TABLE users (id INTEGER PRIMARY KEY,name TEXT,contact Text,description TEXT);";
    await database.execute(sql);
  }
}
