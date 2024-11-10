import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slimyfaq/bloc/cart.bloc.dart';
import 'package:slimyfaq/components/cartModal.dart';

class CartIconButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, cartState) {
        // Calculate the total quantity of items in the cart
        int totalQuantity =
            cartState.items.values.fold(0, (sum, quantity) => sum + quantity);

        return Stack(
          children: [
            IconButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  builder: (_) {
                    return FractionallySizedBox(
                      heightFactor:
                          0.7, // This controls the height of the modal, 0.5 for half, 0.7 for slightly more
                      child: CartModal(),
                    );
                  },
                );
              },
              icon: Icon(Icons.shopping_bag_outlined),
            ),
            // Display quantity badge if there are items in the cart
            if (totalQuantity > 0)
              Positioned(
                right: 0,
                top: 0,
                child: Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  constraints: BoxConstraints(
                    minWidth: 20,
                    minHeight: 20,
                  ),
                  child: Text(
                    '$totalQuantity',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
