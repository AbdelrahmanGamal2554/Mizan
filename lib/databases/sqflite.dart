import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:mizan/models/payment_model.dart';

class SqlHelper {
  Database? _database;
  String tableName = 'loans';
  getDatabase() async {
    if (_database == null) {
      _database = await initDataBase();
      return _database;
    } else {
      return _database;
    }
  }

  initDataBase() async {
    String path = await getDatabasesPath();
    String dbPath = join(path, 'myLoans.db');
    Database db = await openDatabase(
      dbPath,
      version: 1,
      onCreate: (db, version) async {
        Batch batch = db.batch();
        batch.execute('''
CREATE TABLE $tableName(
id INTEGER PRIMARY KEY AUTOINCREMENT,
payment TEXT ,
date TEXT ,
notes TEXT
        )
''');
        await batch.commit();
      },
    );
    return db;
  }

  Future<void> insertData(PaymentModel payment) async {
    Database db = await getDatabase();
    Batch batch = db.batch();
    batch.insert(tableName, payment.toMap());
    batch.commit();
  }

  Future<List<PaymentModel>> getData() async {
    Database db = await getDatabase();
    List<Map<String, dynamic>> payments = await db.query(tableName);
    return List.generate(payments.length, (i) {
      return PaymentModel(
        payment: payments[i]['payment'] as String,
        date: payments[i]['date'] as String,
        notes: payments[i]['notes'] as String,

        id: payments[i]['id'] as int,
      );
    });
  }

  Future<void> update(PaymentModel payment) async {
    Database db = await getDatabase();
    Batch batch = db.batch();
    batch.update(
      tableName,
      payment.toMap(),
      where: 'id = ?',
      whereArgs: [payment.id],
    );
    batch.commit();
  }

  Future<int> delete(int id) async {
    Database db = await getDatabase();
    return db.delete(tableName, where: 'id = ?', whereArgs: [id]);
  }
}
