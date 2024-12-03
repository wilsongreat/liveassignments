import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:liveassignments/presentation/pages/home_nav_page.dart';

import '../main.dart';
import '../utils/constants.dart';
CustomTransitionPage<T> buildPageWithDefaultTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
        child: child,
      );
    },
  );
}


class AppRouterConfig{
  static final GoRouter router = GoRouter(
    navigatorKey: appNavigatorKey,
    initialLocation: '/',
    // observers: [BotToastNavigatorObserver()],
    errorBuilder: (context, state) => const SizedBox(
      child: Center(
        child: Text('Error'),
      ),
    ),
    routes: <RouteBase>[
      GoRoute(
        parentNavigatorKey: appNavigatorKey,
        path: '/',
        name: Constants.home,
        pageBuilder: (context, state) {
          return buildPageWithDefaultTransition(
            context: context,
            state: state,
            child: const HomeNavPage()
          );
        },
      ),
    ],
  );
}