import 'package:aplikasi_pelaporan_kekerasan/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart' as sc;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: sc.PrimaryButton(
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.test);
        },
        child: Text('Ke Test'),
      ),
    );
  }
}
