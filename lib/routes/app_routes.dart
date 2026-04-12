import 'package:aplikasi_pelaporan_kekerasan/views/pages/cloudinary_test.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  // AppRoutes buat halaman yang gaada di navbar
  static const String test = '/test';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case test:
        return MaterialPageRoute(builder: (_) => CloudinaryTestPage());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(body: Center(child: Text("Page not found"))),
        );
    }
  }
}
