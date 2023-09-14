import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../models/Product.dart';
import 'body.dart';

class ColorAndSizeRow extends StatelessWidget {
  const ColorAndSizeRow({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Row(

      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Color'),
              Row(
                children: [
                  ColorBox(color: Color(0xFF3D82AE), isSelected: true),
                  ColorBox(color: Color(0xFFD3A984)),
                  ColorBox(color: Color(0xFF989493)),
                ],
              )
            ],
          ),
        ),
        Expanded(
          child: RichText(
            text:  TextSpan(
                style: const TextStyle(color: kTextColor),
                children: [
                  const TextSpan(text: "Size\n"),
                  TextSpan(text: "${product.size} cm",
                      style: Theme.of(context).textTheme.headline5)

                ]
            ),


          ),
        )
      ],
    );
  }
}
