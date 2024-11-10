import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slimyfaq/components/cartIconButton.dart';
import 'package:slimyfaq/views/product_details.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key, required this.title});

  final String title;

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List products = [
    {
      "name": 'Kaylee Sofa',
      "imageUrl": 'https://wakefitdev.gumlet.io/img/npl_modified_images/SOFA_IMAGES/WSFASLTN3FJDB_LS_1.jpg?w=3840',
      "price": 10.0,
      "color": Colors.indigo[900],
      "description":
          "This is some dummy text for checking purpose and this is long long paragraph to check if this works or not.This is some dummy text for checking purpose and this is long long paragraph to check if this works or not."
    },
    {
      "name": 'Aliana Sofa',
      "imageUrl": 'https://media.homeboxstores.com/i/homebox/165763229-165763229-HMBX21082023N_01-2100.jpg',
      "price": 20.0,
      "color": Colors.yellow[900],
      "description":
          "This is some dummy text for checking purpose and this is long long paragraph to check if this works or not.This is some dummy text for checking purpose and this is long long paragraph to check if this works or not."
    },
    {
      "name": 'Oliver Sofa',
      "imageUrl": 'https://i5.walmartimages.com/seo/MERITLIFE-Modern-Sofa-Couch-Solid-Wood-Frame-Living-Room-Furniture-Removable-Back-Cushion-Seat-Cushion-Blue-88-58-Wide-3-Seater_2bdca44b-2f6f-4042-8297-8f7dc1e6abf6.42786963f0ff80bcb6ae30e61b0bfde5.jpeg',
      "price": 30.0,
      "color": Colors.amber[900],
      "description":
          "This is some dummy text for checking purpose and this is long long paragraph to check if this works or not.This is some dummy text for checking purpose and this is long long paragraph to check if this works or not."
    },
    {
      "name": 'Rayanar Sofa',
      "imageUrl": 'https://media.homeboxstores.com/i/homebox/165843079-165843079-HMBX05092023N_01-2100.jpg',
      "price": 40.0,
      "color": Colors.red[900],
      "description":
          "This is some dummy text for checking purpose and this is long long paragraph to check if this works or not.This is some dummy text for checking purpose and this is long long paragraph to check if this works or not."
    },
    {
      "name": 'Midway Sofa',
      "imageUrl": 'https://media.homeboxstores.com/i/homebox/165660264-165660264-HMBX16052023Q_01-2100.jpg',
      "price": 50.0,
      "color": Colors.orange[900],
      "description":
          "This is some dummy text for checking purpose and this is long long paragraph to check if this works or not.This is some dummy text for checking purpose and this is long long paragraph to check if this works or not."
    },
    {
      "name": 'Takeaway Sofa',
      "imageUrl": 'https://media.homeboxstores.com/i/homebox/165663106-165663106-HMBX31072023N_01-2100.jpg',
      "price": 60.0,
      "color": Colors.deepPurple[900],
      "description":
          "This is some dummy text for checking purpose and this is long long paragraph to check if this works or not.This is some dummy text for checking purpose and this is long long paragraph to check if this works or not."
    },
    {
      "name": 'Permium Sofa',
      "imageUrl": 'https://media.homeboxstores.com/i/homebox/166028462-166028462-HMBX05112023N_01-2100.jpg',
      "price": 70.0,
      "color": Colors.pink[600],
      "description":
          "This is some dummy text for checking purpose and this is long long paragraph to check if this works or not.This is some dummy text for checking purpose and this is long long paragraph to check if this works or not."
    },
    {
      "name": 'High Back Sofa',
      "imageUrl": 'https://media.homeboxstores.com/i/homebox/165557275-165557275-HMBX16052023Q_01-2100.jpg',
      "price": 80.0,
      "color": Colors.green[900],
      "description":
          "This is some dummy text for checking purpose and this is long long paragraph to check if this works or not.This is some dummy text for checking purpose and this is long long paragraph to check if this works or not."
    },
    {
      "name": 'Permium Sofa',
      "imageUrl": 'https://media.homeboxstores.com/i/homebox/165660264-165660264-HMBX16052023Q_01-2100.jpg',
      "price": 90.0,
      "color": Colors.blueGrey[900],
      "description":
          "This is some dummy text for checking purpose and this is long long paragraph to check if this works or not.This is some dummy text for checking purpose and this is long long paragraph to check if this works or not."
    },
    {
      "name": 'Bear Sofa',
      "imageUrl": 'https://media.homeboxstores.com/i/homebox/166028462-166028462-HMBX05112023N_01-2100.jpg',
      "price": 100.0,
      "color": Colors.black,
      "description":
          "This is some dummy text for checking purpose and this is long long paragraph to check if this works or not.This is some dummy text for checking purpose and this is long long paragraph to check if this works or not."
    }
  ];

  String view = 'ListView';
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white.withOpacity(0.98),
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // IconButton(
                //   icon: Icon(
                //     Icons.arrow_back_ios,
                //     size: 16,
                //   ),
                //   onPressed: () {},
                // ),
                Text(
                  "Best Selling",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.nunito(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                // IconButton(
                //   onPressed: () {
                //     setState(() {
                //       if (view == 'ListView') {
                //         view = 'GridView';
                //       } else {
                //         view = 'ListView';
                //       }
                //     });
                //   },
                //   icon: Icon(
                //     view == 'GridView'
                //         ? Icons.list_alt_outlined
                //         : Icons.grid_view_outlined,
                //     size: 20,
                //   ),
                // ),
                CartIconButton()
              ],
            )),
        body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: AnimatedCrossFade(
                duration: Duration(milliseconds: 100),
                firstCurve: Curves.easeIn,
                crossFadeState: view == 'ListView'
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                firstChild: Column(
                    children: List.generate(products.length,
                        (index) => productCardHorizontal(products[index]))),
                secondChild: GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.7,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      return productCardVertical(
                        products[index],
                      );
                    }),
              ),
            )));
  }

  Widget productCardHorizontal(item) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailPage(item: item),
          ),
        )
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Stack(children: [
              Hero(
                tag: item['name'] + item['price'].toString(),
                child: Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(item['imageUrl']), //item['imageUrl']
                      fit: BoxFit.cover,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 25,
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.favorite_border,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 13, vertical: 4),
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                    ),
                  ),
                  child: Text(
                    '\$${item['price']}',
                    style: GoogleFonts.nunito(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w900,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
              )
            ]),
            SizedBox(
              width: 5,
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "●",
                            style: GoogleFonts.nunito(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.amber,
                            ),
                          ),
                          TextSpan(
                            text: ' ${item['name']}',
                            style: GoogleFonts.lato(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      item['description'],
                      style: GoogleFonts.nunito(
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget productCardVertical(item) {
    return GestureDetector(
        onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ProductDetailPage(item: item, view: view),
                ),
              )
            },
        child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(children: [
              Stack(children: [
                Hero(
                  tag: item['name'] + item['price'].toString() + view,
                  child: Container(
                    height: 120,
                    width: 140,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image:
                              NetworkImage(item['imageUrl']), //item['imageUrl']
                          fit: BoxFit.cover,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 25,
                          )
                        ]),
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.favorite_border,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 13, vertical: 4),
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                      ),
                    ),
                    child: Text(
                      '\$${item['price']}',
                      style: GoogleFonts.nunito(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                )
              ]),
              SizedBox(
                height: 5,
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "●",
                      style: GoogleFonts.nunito(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.amber,
                      ),
                    ),
                    TextSpan(
                      text: ' ${item['name']}',
                      style: GoogleFonts.lato(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              // description
              // Flexible(
              //   child: Container(
              //     width: MediaQuery.of(context).size.width * 0.5,
              //     padding: const EdgeInsets.only(right: 10, left: 10, top: 10),
              //     child: Text(
              //       item['description'],
              //       style: GoogleFonts.nunito(
              //         fontSize: 14,
              //         color: Colors.black54,
              //       ),
              //       overflow: TextOverflow.ellipsis,
              //       maxLines: 2,
              //     ),
              //   ),
              // ),
            ])));
  }
}
