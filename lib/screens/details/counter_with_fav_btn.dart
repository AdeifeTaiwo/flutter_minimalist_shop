
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../constants.dart';



class CounterWithFavButton extends StatelessWidget {
  const CounterWithFavButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const CartCounter(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding/2),
          height: 32,
          width: 32,
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFFF6464)
          ),
          child: SvgPicture.asset('assets/icons/heart.svg'),
        )
      ],
    );
  }
}


class CartCounter extends StatefulWidget {
  const CartCounter({super.key});

  @override
  State<StatefulWidget> createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {
  int numOfItem = 1;

  void incrementCartItem() {
    setState(() {
      numOfItem += 1;
    });
  }

  void decrementCartItem() {
    setState(() {
      if (numOfItem > 0) {
        numOfItem -= 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        buildOutlinedButton(Icons.remove, decrementCartItem),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding/2),
          child: Text( numOfItem<10? '0$numOfItem':'$numOfItem', style: Theme.of(context).textTheme.headline6?.copyWith()),
        ),
        buildOutlinedButton(Icons.add, incrementCartItem)
      ],
    );
  }

  SizedBox buildOutlinedButton(IconData icon, Function press) {
    return SizedBox(
        width: 32,
        height: 28,
        child: OutlinedButton(
            onPressed: () {
              press();
            },
            style: OutlinedButton.styleFrom(
              padding: EdgeInsets.zero,
              foregroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              alignment: Alignment.center,
            ),
            child: Icon(icon)));
  }
}