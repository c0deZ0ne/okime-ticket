import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class DBhelper {
  DBhelper._privateConstructor();
  static final DBhelper instance = DBhelper._privateConstructor();

  static Database? _database;
  static bool _isInitialized = false;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDb('medical.db');
    return _database!;
  }

  // Initialize database factory if not already done
  static void _initializeDatabaseFactory() {
    if (!_isInitialized) {
      sqfliteFfiInit();
      databaseFactory = databaseFactoryFfi;
      _isInitialized = true;
    }
  }

  Future<Database> _initDb(String fileName) async {
    try {
      _initializeDatabaseFactory(); // Ensure factory is initialized
      
      final dbPath = await getDatabasesPath();
      final path = join(dbPath, fileName);
      print("Opening database at $path");
      
      return await openDatabase(
        path, 
        version: 1, 
        onCreate: _createDb,
        onConfigure: (db) async {
          await db.execute('PRAGMA foreign_keys = ON');
        }
      );
    } catch (e, st) {
      print("Db init error $e");
      print("Db init error $st");
      rethrow;
    }
  }

  Future<void> _createDb(Database db, int version) async {
    await db.execute('''
      CREATE TABLE IF NOT EXISTS patients (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        age INTEGER NOT NULL,
        diagnosis TEXT NOT NULL
      )
    ''');
  }

  Future<int> insertPatient(Map<String, dynamic> row) async {
    final db = await database;
    return await db.insert("patients", row);
  }

  Future<int> updatePatient(Map<String, dynamic> row) async {
    final db = await database;
    final id = row['id'] as int;
    return await db.update('patients', row, where: "id = ?", whereArgs: [id]);
  }

  Future<int> deletePatient(int id) async {
    final db = await database;
    return await db.delete("patients", where: 'id=?', whereArgs: [id]);
  }

  Future<List<Map<String, dynamic>>> fetchPatients() async {
    final db = await database;
    return await db.query("patients", orderBy: 'id DESC');
  }

  Future<void> closeDb() async {
    final db = _database;
    if (db != null) {
      await db.close();
      _database = null;
    }
  }
}