import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slimyfaq/bloc/cart.bloc.dart';

class ProductDetailPage extends StatefulWidget {
  final item;
  final view;
  const ProductDetailPage({super.key, this.item, this.view});

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  Widget build(BuildContext context) {
    // make product detail page
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(top: 42, left: 32, right: 32),
      child: SingleChildScrollView(
          // rounded image with shadow and back button and favorite button in row on image
          child: Column(
        children: [
          Stack(children: <Widget>[
            Hero(
              tag: widget.item['name'] + widget.item['price'].toString(),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(widget.item['imageUrl']),
                      fit: BoxFit.cover,
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.red.withOpacity(0.03),
                          blurRadius: 2,
                          spreadRadius: 5)
                    ]),
              ),
            ),
            Positioned(
              top: 10,
              right: 10,
              left: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    height: 32,
                    width: 32,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.arrow_back, size: 16),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Container(
                    height: 32,
                    width: 32,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.favorite_border, size: 16),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            )
          ]),
          SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // name and price of product in row with bold name and red price
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        widget.item['name'],
                        style: GoogleFonts.poppins(
                            fontSize: 22,
                            fontWeight: FontWeight.w900,
                            color: Colors.black),
                      ),
                      Text(
                        '\$${widget.item['price']}',
                        style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          RichText(
                            text: TextSpan(
                                text: 'By ',
                                style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black.withOpacity(0.5)),
                                children: [
                                  TextSpan(
                                    text: 'Kaylee',
                                    style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black),
                                  )
                                ]),
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.black,
                            size: 16,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            '4.5',
                            style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 22),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'About this product',
                        style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.black),
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    widget.item['description'],
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black.withOpacity(0.5)),
                  ),
                ),
                // divider
                Padding(
                  padding: const EdgeInsets.only(top: 32),
                  child: Container(
                    height: 1,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.black.withOpacity(0.1),
                  ),
                ),
                // rating , delivery and time in row with icon and text
                Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.star_outline,
                                color: Colors.black,
                                size: 24,
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                '4.5',
                                style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.access_time_outlined,
                                color: Colors.black,
                                size: 24,
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                '30 min',
                                style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.local_shipping_outlined,
                                color: Colors.black,
                                size: 24,
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                'Free',
                                style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ])),
                // add to cart button
                // Padding(
                //   padding: const EdgeInsets.only(top: 32),
                //   child: Container(
                //     height: 60,
                //     width: MediaQuery.of(context).size.width,
                //     decoration: BoxDecoration(
                //       color: Colors.black,
                //       borderRadius: BorderRadius.circular(10),
                //     ),
                //     child: Center(
                //       child: Text(
                //         'Add to cart',
                //         style: GoogleFonts.poppins(
                //             fontSize: 16,
                //             fontWeight: FontWeight.w700,
                //             color: Colors.white),
                //       ),
                //     ),
                //   ),
                // ),
                Padding(
                    padding: const EdgeInsets.only(top: 32),
                    child: BlocBuilder<CartBloc, CartState>(
                      builder: (context, cartState) {
                        final quantity = cartState.items[widget.item] ?? 0;

                        return quantity == 0
                            ? ElevatedButton(
                                onPressed: () {
                                  context
                                      .read<CartBloc>()
                                      .add(AddToCartEvent(widget.item));
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    minimumSize: Size(
                                        MediaQuery.of(context).size.width, 60)),
                                child: Text(
                                  'Add to cart',
                                  style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white),
                                ),
                              )
                            : Container(
                              height: 60,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.black),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.remove),
                                      onPressed: () {
                                        context.read<CartBloc>().add(
                                            RemoveFromCartEvent(widget.item));
                                      },
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 16,
                                    ),
                                    Text(
                                      '$quantity',
                                      style: GoogleFonts.poppins(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white),
                                    ),
                                    SizedBox(
                                      width: 16,
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.add),
                                      onPressed: () {
                                        context
                                            .read<CartBloc>()
                                            .add(AddToCartEvent(widget.item));
                                      },
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              );
                      },
                    ))
              ],
            ),
          )
        ],
      )),
    ));
  }
}
