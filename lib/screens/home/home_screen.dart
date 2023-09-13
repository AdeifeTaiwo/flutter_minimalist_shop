import 'package:flutter/material.dart';
import 'package:flutter_minimalist_shop/components/body.dart';
import 'package:flutter_minimalist_shop/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
    );
  }

  AppBar buildAppBar(){
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(icon: SvgPicture.asset('assets/icons/back.svg'), onPressed: (){},),
      actions: [
        IconButton(icon: SvgPicture.asset('assets/icons/search.svg'),color: kTextColor, onPressed: (){},),
        IconButton(icon: SvgPicture.asset('assets/icons/cart.svg'),color: kTextColor, onPressed: (){},),
        const SizedBox(width: kDefaultPadding/2,)
      ],
    );
  }
}
