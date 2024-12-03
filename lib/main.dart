import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:liveassignments/app/app.dart';


final GlobalKey<NavigatorState>  appNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
void main() {
  runApp(const ProviderScope(
      child: LiveMatchApp()));
}


