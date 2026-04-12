import 'package:aplikasi_pelaporan_kekerasan/routes/app_routes.dart';
import 'package:aplikasi_pelaporan_kekerasan/views/layouts/main_layout.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadcnApp(
      title: 'Demo',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRoutes.generateRoute,
      home: const MainLayout(),
    );
  }
}
