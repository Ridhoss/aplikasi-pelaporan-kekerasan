import 'package:aplikasi_pelaporan_kekerasan/services/mongo_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() {
  late MongoService mongo;

  setUpAll(() async {
    await dotenv.load(fileName: ".env");
    mongo = MongoService();
  });

  test('MongoDB Connection Test', () async {
    final result = await mongo.testConnection();

    expect(result, true, reason: "MongoDB harus berhasil connect");
  });

  tearDownAll(() async {
    await mongo.close();
  });
}