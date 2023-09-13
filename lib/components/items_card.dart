import 'package:flutter/cupertino.dart';
import '../constants.dart';
import '../models/Product.dart';

class ItemCard extends StatelessWidget {
  final Product product;
  final Function onPressItemCard;

  const ItemCard(
      {required this.product, required this.onPressItemCard, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {onPressItemCard()},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(kDefaultPadding),
              decoration: BoxDecoration(
                  color: product.color,
                  borderRadius: BorderRadius.circular(16)),
              child: Hero(tag: product.id, child: Image.asset(product.image)),
            ),
          ),
          Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: kDefaultPadding / 4),
              child: Text(
                product.title,
                style: const TextStyle(color: kTextLightColor),
              )),
          Text(
            '\$${product.price}',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
