import 'package:flutter/material.dart';
import '../config/app_colors.dart';
import '../config/router.dart';

class LiveMatchApp extends StatelessWidget {
  const LiveMatchApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(
    BuildContext context,
  ) {
    return MaterialApp.router(
      title: 'Live Match App',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(),
        primaryColor: AppColors.kBg,
        useMaterial3: true,
      ),
      routerConfig: AppRouterConfig.router,
    );
  }
}
