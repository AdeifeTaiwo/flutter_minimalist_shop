import 'package:flutter/material.dart';
import 'package:flutter_minimalist_shop/constants.dart';
import 'package:flutter_minimalist_shop/models/Product.dart';
import 'package:flutter_minimalist_shop/screens/details/details_screen.dart';
import 'categories.dart';
import 'items_card.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Text("Women",
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  ?.copyWith(fontWeight: FontWeight.bold)),
        ),
        const Categories(),
        Expanded(
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: GridView.builder(
                    itemCount: products.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisSpacing: kDefaultPadding,
                            crossAxisSpacing: kDefaultPadding,
                            childAspectRatio: 0.75,
                            crossAxisCount: 2),
                    itemBuilder: (context, index) => ItemCard(
                        product: products[index],
                        onPressItemCard: () => {
                              print('active'),
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailsScreen(
                                          product: products[index])))
                            })))),
      ],
    );
  }
}
