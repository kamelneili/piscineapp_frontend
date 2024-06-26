import 'package:piscine_app/blocs/profile/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

import '../../blocs/auth/auth_bloc.dart';
import '../../blocs/cubits/login/login_cubit.dart';
import '../../widgets/custom_buttom.dart';

//import '/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = '/loginScreen';

  const LoginScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const LoginScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: CustomAppBar(title: 'Login'),
      //  bottomNavigationBar: CustomNavBar(screen: routeName),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _EmailInput(),
            const SizedBox(height: 10),
            _PasswordInput(),
            const SizedBox(height: 10),
            Text(
              'Login',
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: Colors.white,
                  ),
            ),

            CustomButton(

                //
                title: 'LogIn',
                onTap: () async {
                  //
                  await context.read<LoginCubit>().logInWithCredentials();
                  final user = auth.FirebaseAuth.instance.currentUser;
                  print(user);
                  if (user == null) {
                    const snackBar = SnackBar(
                        content: Text('You are not registered yet',
                            style: TextStyle(color: Colors.pinkAccent)));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  } else {
                    //  context.read<ProfileBloc>().add(
                    //    LoadProfile(context.read<AuthBloc>().state.authUser));
                    Navigator.pushNamed(context, '/home');
                    const snackBar = SnackBar(
                        content: Text('Bienvenue, bien connecté !!!',
                            style: TextStyle(color: Colors.green)));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                }),

            const SizedBox(height: 10),
            CustomButton(
                title: 'SignUp',
                onTap: () {
                  Navigator.pushNamed(context, '/SignupScreen');
                }),
            //   _GoogleLoginButton(),
          ],
        ),
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextField(
          onChanged: (email) {
            context.read<LoginCubit>().emailChanged(email);
          },
          decoration: const InputDecoration(labelText: 'Email'),
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextField(
          onChanged: (password) {
            context.read<LoginCubit>().passwordChanged(password);
          },
          decoration: const InputDecoration(labelText: 'Password'),
          obscureText: true,
        );
      },
    );
  }
}

// class _GoogleLoginButton extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: () {
//         context.read<LoginCubit>().logInWithGoogle();
//       },
//       style: ElevatedButton.styleFrom(
//         shape: RoundedRectangleBorder(),
//         primary: Colors.white,
//         fixedSize: Size(200, 40),
//       ),
//       child: Text(
//         'Sign In with Google',
//         style: Theme.of(context).textTheme.headline4!.copyWith(
//               color: Colors.black,
//             ),
//       ),
//     );
//   }
// }
