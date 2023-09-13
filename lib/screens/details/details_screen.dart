
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_minimalist_shop/models/Product.dart';
import 'package:flutter_minimalist_shop/screens/details/body.dart';
import 'package:flutter_svg/svg.dart';
import '../../constants.dart';

class DetailsScreen extends StatelessWidget{

  final Product product;
  const DetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: product.color,
      appBar: AppBar(
        backgroundColor: product.color,
        elevation: 0,
        leading: IconButton(icon: SvgPicture.asset('assets/icons/back.svg'), color: Colors.white, onPressed: (){
          Navigator.pop(context);
        },),

        actions: [
          IconButton(icon: SvgPicture.asset('assets/icons/search.svg'),color: Colors.white, onPressed: (){},),
          IconButton(icon: SvgPicture.asset('assets/icons/add_to_cart.svg'),color: Colors.white, onPressed: (){},),
          const SizedBox(width: kDefaultPadding/2)
        ],
      ),
      body: Body(product: product),
    );
  }

}