import 'package:flutter/material.dart';
import 'package:forms_app/config/router/go_router.dart';
import 'package:forms_app/config/theme/app_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(),
      // home: Scaffold(body: Center(child: Text('Hello World!'))), //Ya tenemos control de rutas con go_router
    );
  }
}
