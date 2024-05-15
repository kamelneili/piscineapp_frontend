import 'package:piscine_app/config/constants.dart';
import 'package:piscine_app/config/size_config.dart';
import 'package:piscine_app/widgets/custom_buttom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // super.initState();
    // new Future.delayed(
    //   const Duration(seconds: 3),
    //   // () => Navigator.push(
    //   //       context,
    //   //       MaterialPageRoute(builder: (context) => HomeScreen()),
    //   //     )
    // );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: SizedBox(
                width: double.infinity,
                height: SizeConfig.blockSizeVertical! * 50,
                child: const Image(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/splash.jpg'),
                ),
              ),
            ),
            Container(
              height: 70.h,
              // color: Colors.black,
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Text(
                'Bienvenue à Royale Piscine',
                style: kEncodeSansBold.copyWith(color: Colors.black),
              ),
            ),
            SizedBox(
              height: 20.sp,
            ),
            //

            CustomButton(
                title: 'Commencer',
                onTap: () {
                  Navigator.of(context).pushNamed(
                    '/home',
                  );
                }),
          ],
        ),
      ),
    ));
  }
}
