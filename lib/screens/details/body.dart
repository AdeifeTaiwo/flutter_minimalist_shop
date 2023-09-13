import 'package:flutter/material.dart';
import 'package:flutter_minimalist_shop/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../models/Product.dart';
import 'add_to_cart.dart';
import 'color_and_size_row.dart';
import 'counter_with_fav_btn.dart';

class Body extends StatelessWidget {
  const Body({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: size.height,
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.3),
                  padding: EdgeInsets.only(
                      top: size.height * 0.12,
                      left: kDefaultPadding,
                      right: kDefaultPadding),
                  height: 500,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ColorAndSizeRow(product: product),
                      const SizedBox(height: kDefaultPadding/2,),
                      Description(product: product),
                      const SizedBox(height: kDefaultPadding/2,),
                      const CounterWithFavButton(),
                      const SizedBox(height: kDefaultPadding/2,),
                      AddToCart(product: product)
                    ],
                  ),
                ),
                productTitleWithImage(context)
              ],
            ),
          )
        ],
      ),
    );
  }

  Padding productTitleWithImage(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(product.title, style: const TextStyle(color: Colors.white)),
          Text(product.title,
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
          Row(
            children: [
              RichText(
                  text: TextSpan(children: [
                const TextSpan(text: 'Price\n'),
                TextSpan(
                    text: '\$${product.price}',
                    style: Theme.of(context).textTheme.headline4?.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold))
              ])),
              const SizedBox(height: 8),
              Expanded(
                  child: Hero(
                    tag: product.id,
                    child: Image.asset(
                product.image,
                fit: BoxFit.fill,
              ),
                  ))
            ],
          )
        ],
      ),
    );
  }
}


class Description extends StatelessWidget {
  const Description({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
      child: Text(product.description, style: TextStyle(height: 1.5)),
    );
  }
}

class ColorBox extends StatelessWidget {
  const ColorBox({super.key, required this.color, this.isSelected = false});

  final Color color;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
          top: kDefaultPadding / 4, right: kDefaultPadding / 2),
      padding: const EdgeInsets.all(2.5),
      height: 24,
      width: 24,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: isSelected ? color : Colors.white)),
      child: DecoratedBox(
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      ),
    );
  }
}
