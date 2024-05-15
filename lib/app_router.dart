import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:piscine_app/home/home_screen.dart';
import 'package:piscine_app/home/models/actualite_model.dart';
import 'package:piscine_app/models/product_model.dart';
import 'package:piscine_app/profile/profile_screen.dart';
import 'package:piscine_app/screens/account/account_screen.dart';
import 'package:piscine_app/screens/basket/basket_screen.dart';
import 'package:piscine_app/screens/delivery_time/delivery_time_screen.dart';
import 'package:piscine_app/screens/login/login_screen.dart';
import 'package:piscine_app/screens/product_details/product_details_screen.dart';
import 'package:piscine_app/screens/signup/signup_screen.dart';
import 'package:piscine_app/screens/splash/splash_screen.dart';
import 'package:piscine_app/widgets/contact_us.dart';

import 'screens/home/home_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/splash':
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      case '/home':
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case '/ProductDetails':
        return MaterialPageRoute(
          builder: (_) => ProductDetails(
            product: settings.arguments as Actualite,
          ),
        );
      case '/basket':
        return MaterialPageRoute(
          builder: (_) => const BasketScreen(),
        );
      case '/delivery_time':
        return MaterialPageRoute(
          builder: (_) =>
              DeliveryTimeScreen(product: settings.arguments as Actualite),
        );
      case '/profile':
        return MaterialPageRoute(
          builder: (_) => const ProfileScreen(),
        );
      case '/account':
        return MaterialPageRoute(
          builder: (_) => const AccountScreen(),
        );
      case '/loginScreen':
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      case '/SignupScreen':
        return MaterialPageRoute(
          builder: (_) => const SignupScreen(),
        );
      case '/ProfileScreen':
        return MaterialPageRoute(
          builder: (_) => const SignupScreen(),
        );
      case '/contactInformation':
        return MaterialPageRoute(
          builder: (_) => const ContactInformation(),
        );
    }
    return null;
  }
}
