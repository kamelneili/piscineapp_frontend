import 'dart:ffi';

import 'package:piscine_app/config/constants.dart';
import 'package:piscine_app/config/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:piscine_app/home/models/actualite_model.dart';

import '../../models/product_model.dart';
import '../../widgets/custom_buttom.dart';
import '../../widgets/product_information.dart';

class ProductDetails extends StatelessWidget {
  final Actualite product;
  const ProductDetails({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    //  Restaurant restaurant = Restaurant.restaurants[0];
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: SizeConfig.blockSizeVertical! * 4,
                              width: SizeConfig.blockSizeVertical! * 4,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: kWhiteColor,
                              ),
                              child: SvgPicture.asset(
                                  'assets/left-navigation-back-svgrepo-com.svg'),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: SizeConfig.blockSizeVertical! * 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.elliptical(
                              MediaQuery.of(context).size.width, 50),
                        ),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            product.image,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                ProductInformation(product: product),
                CustomButton(
                  title: "Prendre rendez-vous",
                  onTap: () async {
                    final user = auth.FirebaseAuth.instance.currentUser;
                    print(user);
                    // user != null
                    //     ?
                    Navigator.pushNamed(context, '/delivery_time',
                        arguments: product);
                    // :
                    // Navigator.pushNamed(context, '/loginScreen');
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  //** */
}
