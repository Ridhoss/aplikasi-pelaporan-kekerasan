import 'package:aplikasi_pelaporan_kekerasan/routes/app_routes.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text("Test"),
          onPressed: () {
            Navigator.pushNamed(context, AppRoutes.test);
          },
        ),
      ),
    );
  }
}
