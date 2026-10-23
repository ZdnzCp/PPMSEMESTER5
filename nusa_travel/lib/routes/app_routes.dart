import 'package:flutter/material.dart';

import '../models/tour_package.dart';
import '../screens/detail_screen.dart';
import '../screens/home_screen.dart';
import '../screens/not_found_screen.dart';
import '../screens/splash_screen.dart';

class AppRoutes {
  AppRoutes._();

  static const String splash = '/';
  static const String home = '/home';
  static const String detail = '/detail';

  /// Route statis (tanpa arguments)
  static final Map<String, WidgetBuilder> routes = {
    splash: (context) => const SplashScreen(),
    home: (context) => const HomeScreen(),
  };

  /// Route dinamis (membaca arguments).
  /// Mengembalikan null jika nama route / arguments tidak valid,
  /// sehingga Flutter akan memanggil onUnknownRoute.
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    if (settings.name == detail) {
      final args = settings.arguments;
      if (args is TourPackage) {
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => DetailScreen(package: args),
        );
      }
    }
    return null;
  }

  /// Dipanggil saat route tidak ditemukan -> halaman 404
  static Route<dynamic> onUnknownRoute(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (context) => NotFoundScreen(routeName: settings.name),
    );
  }
}
