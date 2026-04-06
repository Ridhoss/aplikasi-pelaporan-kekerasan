import 'package:aplikasi_pelaporan_kekerasan/views/pages/home_page.dart';
import 'package:aplikasi_pelaporan_kekerasan/views/pages/test_page.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String home = '/';
  static const String test = '/test';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => HomePage());

      case test:
        return MaterialPageRoute(builder: (_) => TestPage());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(body: Center(child: Text("Page not found"))),
        );
    }
  }
}
