import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slimyfaq/bloc/cart.bloc.dart';
import 'package:lottie/lottie.dart'; // For the success animation

class CartModal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, cartState) {
        final items = cartState.items;

        return GestureDetector(
          onTap: () =>
              FocusScope.of(context).unfocus(), // Close keyboard if any open
          child: Material(
            color: Colors.transparent,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Column(
                children: [
                  // Draggable handle
                  Container(
                    width: 40,
                    height: 5,
                    margin: EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  SizedBox(height: 20),

                  // Cart Empty or List
                  if (items.isEmpty)
                    _buildEmptyCart()
                  else
                    _buildCartList(context, items),

                  // Divider separating total from checkout button
                  if (items.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Divider(
                        color: Colors.grey[300],
                        thickness: 1,
                      ),
                    ),

                  // Total amount
                  if (items.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: _buildTotalAmount(context, items),
                    ),

                  // Checkout Button (Only visible when items are in the cart)
                  if (items.isNotEmpty) _buildCheckoutButton(context),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // Empty Cart UI
  Widget _buildEmptyCart() {
    return Expanded(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "No Items Added",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "😔",
              style: TextStyle(fontSize: 40),
            ),
          ],
        ),
      ),
    );
  }

  // Cart List UI
  Widget _buildCartList(BuildContext context, Map items) {
    return Expanded(
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items.keys.toList()[index];
          final quantity = items[item]!;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                // Product Image
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(item['imageUrl']),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 16),
                // Product Info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item['name'],
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 4),
                      Text(
                        '\$${item['price']}',
                        style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
                // Quantity Controls
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove_circle_outline),
                      onPressed: () => context
                          .read<CartBloc>()
                          .add(RemoveFromCartEvent(item)),
                    ),
                    Text(
                      '$quantity',
                      style: TextStyle(fontSize: 16),
                    ),
                    IconButton(
                      icon: Icon(Icons.add_circle_outline),
                      onPressed: () =>
                          context.read<CartBloc>().add(AddToCartEvent(item)),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // Function to calculate the total amount
  double _calculateTotal(Map items) {
    double total = 0.0;
    items.forEach((item, quantity) {
      total += item['price'] * quantity;
    });
    return total;
  }

  // Display total amount
  Widget _buildTotalAmount(BuildContext context, Map items) {
    final total = _calculateTotal(items);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Total:',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(
          '\$${total.toStringAsFixed(2)}',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  // Checkout Button
  Widget _buildCheckoutButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: GestureDetector(
        onTap: () async {
          // Show loader
          showDialog(
            context: context,
            builder: (_) => Center(
              child: CircularProgressIndicator(),
            ),
          );

          // Simulate a checkout process (delay for 2 seconds)
          await Future.delayed(Duration(seconds: 2));

          // Clear cart after checkout (dispatch event to clear cart)
          context.read<CartBloc>().add(ClearCartEvent());

          // Close the loader
          Navigator.pop(context);

          // Show success animation
          _showSuccessDialog(context);
        },
        child: Container(
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.black, // Button color
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(
              'Proceed to Checkout',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  // Success Dialog with animation
  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible:
          false, // Prevent dismissing the dialog by tapping outside
      builder: (context) {
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.check_circle,
                  size: 100,
                  color: Colors.orange,
                ),
                SizedBox(height: 20),
                Text(
                  'Thank you for ordering!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Lorem ipsum dolor sit amet, consetetur sadipscing elitr,\nsed diam nonumy eirmod tempor',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 30),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 15,
                        ),
                        minimumSize:
                            Size(MediaQuery.of(context).size.width, 60),
                        side: BorderSide(
                          width: 2.0,
                          color: Colors.black,
                          style: BorderStyle.solid,
                          
                        ),
                        
                      ),
                      child: Text('VIEW ORDER' , style: TextStyle(color: Colors.black),),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        padding: EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 15,
                        ),
                        minimumSize:
                            Size(MediaQuery.of(context).size.width, 60),
                        textStyle: TextStyle(fontSize: 16 , color: Colors.white),
                      ),
                      child: Text('CONTINUE SHOPPING'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
