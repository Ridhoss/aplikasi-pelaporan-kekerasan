import 'package:mongo_dart/mongo_dart.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../helpers/log_helper.dart';

class MongoService {
  static final MongoService _instance = MongoService._internal();

  factory MongoService() => _instance;
  MongoService._internal();

  Db? _db;
  bool _isConnecting = false;

  final String _source = "mongo_service.dart";

  Future<Db> getDb() async {
    if (_db != null && _db!.isConnected) {
      return _db!;
    }

    await connect();
    return _db!;
  }

  Future<void> connect() async {
    if (_isConnecting) return;

    try {
      _isConnecting = true;

      final dbUri = dotenv.env['MONGODB_URI'];
      if (dbUri == null) {
        throw Exception("MONGODB_URI tidak ditemukan di .env");
      }

      _db = await Db.create(dbUri);

      await _db!.open().timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          throw Exception(
            "Koneksi timeout. Cek internet / IP whitelist MongoDB",
          );
        },
      );

      await LogHelper.writeLog(
        "DATABASE: Connected",
        source: _source,
        level: 2,
      );
    } catch (e, st) {
      await LogHelper.writeLog(
        "DATABASE: Connection Failed - $e",
        source: _source,
        level: 1,
        error: e,
        stackTrace: st,
      );
      rethrow;
    } finally {
      _isConnecting = false;
    }
  }

  Future<DbCollection> getCollection(String name) async {
    final db = await getDb();
    return db.collection(name);
  }

  Future<bool> testConnection() async {
    try {
      final db = await getDb();

      final result = await db.executeDbCommand(DbCommand.createPingCommand(db));

      final ok = result['ok'] == 1;

      await LogHelper.writeLog(
        ok ? "DATABASE: Ping success" : "DATABASE: Ping failed",
        source: _source,
        level: ok ? 2 : 1,
      );

      return ok;
    } catch (e, st) {
      await LogHelper.writeLog(
        "DATABASE: Test connection failed - $e",
        source: _source,
        level: 1,
        error: e,
        stackTrace: st,
      );
      return false;
    }
  }

  Future<void> close() async {
    if (_db != null && _db!.isConnected) {
      await _db!.close();

      await LogHelper.writeLog(
        "DATABASE: Connection closed",
        source: _source,
        level: 2,
      );
    }
  }
}
