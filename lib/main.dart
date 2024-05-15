// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:piscine_app/app_router.dart';
import 'package:piscine_app/blocs/appointment/appointment_event.dart';
import 'package:piscine_app/blocs/auth/auth_bloc.dart';
import 'package:piscine_app/blocs/cubits/login/login_cubit.dart';
import 'package:piscine_app/blocs/cubits/signup/signup_cubit.dart';
import 'package:piscine_app/config/theme.dart';
import 'package:piscine_app/home/blocs/actualite_bloc.dart';
import 'package:piscine_app/home/blocs/actualite_event.dart';
import 'package:piscine_app/home/home_screen.dart';
import 'package:piscine_app/home/repositories/actualite_repository.dart';
import 'package:piscine_app/repositories/appointment/appointment_repository.dart';
import 'package:piscine_app/screens/home/home_screen.dart';
import 'package:piscine_app/screens/signup/signup_screen.dart';
import 'package:piscine_app/screens/splash/splash_screen.dart';
import 'package:piscine_app/translations/codegen_loader.g.dart';

import 'blocs/appointment/appointment_bloc.dart';
import 'blocs/basket/basket_bloc.dart';
import 'blocs/product/product_bloc.dart';
import 'blocs/profile/profile_bloc.dart';
import 'repositories/repositories.dart';
import 'repositories/services/storage_service.dart';
import 'repositories/user/user_repository.dart';

import 'package:easy_localization/easy_localization.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.black26));
  await EasyLocalization.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  runApp(EasyLocalization(
      path: 'assets/translations',
      // ignore: prefer_const_literals_to_create_immutables
      supportedLocales: [
        const Locale('en'),
        const Locale('ar'),
        const Locale('fr'),
        const Locale('de'),
      ],
      fallbackLocale: const Locale('en'),
      assetLoader: const CodegenLoader(),
      child: MyApp(
        appRouter: AppRouter(),
      )));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;

  const MyApp({
    super.key,
    required this.appRouter,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: appRouter.generateRoute,
      debugShowCheckedModeBanner: false,
      theme: theme(),
      home: MultiRepositoryProvider(
        providers: [
          RepositoryProvider(
            create: (context) => UserRepository(),
          ),
          RepositoryProvider(
            create: (context) => AppointmentRepository(),
          ),
          RepositoryProvider(
            create: (context) => AuthRepository(
              userRepository: context.read<UserRepository>(),
            ),
          ),
          RepositoryProvider(
            create: (context) => StorageRepository(),
          ),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => AuthBloc(
                  authRepository: context.read<AuthRepository>(),
                  userRepository: context.read<UserRepository>(),
                  storageRepository: context.read<StorageRepository>()),
            ),
            BlocProvider(
              create: (context) => LoginCubit(
                authRepository: context.read<AuthRepository>(),
              ),
            ),
            BlocProvider(
              create: (_) => ProductBloc(productRepository: ProductRepository())
                ..add(LoadProducts()),
            ),
            BlocProvider(
              create: (context) => ProfileBloc(
                authBloc: BlocProvider.of<AuthBloc>(context),
                userRepository: context.read<UserRepository>(),
              )..add(
                  LoadProfile(auth.FirebaseAuth.instance.currentUser),
                ),
            ),

            BlocProvider(create: (context) => BasketBloc()..add(StartBasket())),
            BlocProvider(
              create: (context) =>
                  ActualiteBloc(actualiteRepository: ActualiteRepository())
                    ..add(const LoadActualite()),
            ),
            BlocProvider(
              create: (context) => SignupCubit(
                authRepository: context.read<AuthRepository>(),
              ),
            ),
            BlocProvider(
                create: (context) => AppointmentBloc(
                      appointmentRepository:
                          context.read<AppointmentRepository>(),
                    )..add(LoadAppointments(
                        context.read<AuthBloc>().state.authUser))),

            // BlocProvider(
            //     create: (context) => AuthBloc(
            //           userRepository: UserRepository(),
            //           //   databaseRepository: DatabaseRepository()
            //         )),
            // BlocProvider(
            //     create: (context) => UserBloc(
            // // userRepository: UserRepository(),
            // databaseRepository: DatabaseRepository()))
          ],
          child: ScreenUtilInit(
              designSize: const Size(375, 812),
              minTextAdapt: true,
              child: MaterialApp(
                supportedLocales: context.supportedLocales,
                localizationsDelegates: context.localizationDelegates,
                locale: context.locale,
                debugShowCheckedModeBanner: false,
                onGenerateRoute: appRouter.generateRoute,
                home: SplashScreen(),
                routes: {
                  "home_screen": (context) => HomeScreen(),
                },
              )),
        ),
      ),
    );
  }
}
