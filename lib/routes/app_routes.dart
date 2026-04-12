import 'package:aplikasi_pelaporan_kekerasan/views/pages/test_page.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  // AppRoutes buat halaman yang gaada di navbar
  static const String test = '/test';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case test:
        return MaterialPageRoute(builder: (_) => TestPage());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(body: Center(child: Text("Page not found"))),
        );
    }
  }
}
