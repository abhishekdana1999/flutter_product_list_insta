import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slimyfaq/product_details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        fontFamily: GoogleFonts.lato().fontFamily,
      ),
      home: const MyHomePage(title: ''),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List products = [
    {
      "name": 'Kaylee Sofa',
      "imageUrl": 'https://picsum.photos/200/300',
      "price": 10.0,
      "color": Colors.indigo[900],
      "description":
          "This is some dummy text for checking purpose and this is long long paragraph to check if this works or not.This is some dummy text for checking purpose and this is long long paragraph to check if this works or not."
    },
    {
      "name": 'Aliana Sofa',
      "imageUrl": 'https://picsum.photos/200/300',
      "price": 20.0,
      "color": Colors.yellow[900],
      "description":
          "This is some dummy text for checking purpose and this is long long paragraph to check if this works or not.This is some dummy text for checking purpose and this is long long paragraph to check if this works or not."
    },
    {
      "name": 'Oliver Sofa',
      "imageUrl": 'https://picsum.photos/200/300',
      "price": 30.0,
      "color": Colors.amber[900],
      "description":
          "This is some dummy text for checking purpose and this is long long paragraph to check if this works or not.This is some dummy text for checking purpose and this is long long paragraph to check if this works or not."
    },
    {
      "name": 'Rayanar Sofa',
      "imageUrl": 'https://picsum.photos/200/300',
      "price": 40.0,
      "color": Colors.red[900],
      "description":
          "This is some dummy text for checking purpose and this is long long paragraph to check if this works or not.This is some dummy text for checking purpose and this is long long paragraph to check if this works or not."
    },
    {
      "name": 'Midway Sofa',
      "imageUrl": 'https://picsum.photos/200/300',
      "price": 50.0,
      "color": Colors.orange[900],
      "description":
          "This is some dummy text for checking purpose and this is long long paragraph to check if this works or not.This is some dummy text for checking purpose and this is long long paragraph to check if this works or not."
    },
    {
      "name": 'Takeaway Sofa',
      "imageUrl": 'https://picsum.photos/200/300',
      "price": 60.0,
      "color": Colors.deepPurple[900],
      "description":
          "This is some dummy text for checking purpose and this is long long paragraph to check if this works or not.This is some dummy text for checking purpose and this is long long paragraph to check if this works or not."
    },
    {
      "name": 'Permium Sofa',
      "imageUrl": 'https://picsum.photos/200/300',
      "price": 70.0,
      "color": Colors.pink[600],
      "description":
          "This is some dummy text for checking purpose and this is long long paragraph to check if this works or not.This is some dummy text for checking purpose and this is long long paragraph to check if this works or not."
    },
    {
      "name": 'High Back Sofa',
      "imageUrl": 'https://picsum.photos/200/300',
      "price": 80.0,
      "color": Colors.green[900],
      "description":
          "This is some dummy text for checking purpose and this is long long paragraph to check if this works or not.This is some dummy text for checking purpose and this is long long paragraph to check if this works or not."
    },
    {
      "name": 'Permium Sofa',
      "imageUrl": 'https://picsum.photos/200/300',
      "price": 90.0,
      "color": Colors.blueGrey[900],
      "description":
          "This is some dummy text for checking purpose and this is long long paragraph to check if this works or not.This is some dummy text for checking purpose and this is long long paragraph to check if this works or not."
    },
    {
      "name": 'Bear Sofa',
      "imageUrl": 'https://picsum.photos/200/300',
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
                IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    size: 16,
                  ),
                  onPressed: () {},
                ),
                Text(
                  "Best Selling",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.nunito(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      if (view == 'ListView') {
                        view = 'GridView';
                      } else {
                        view = 'ListView';
                      }
                    });
                  },
                  icon: Icon(
                    view == 'GridView'
                        ? Icons.list_alt_outlined
                        : Icons.grid_view_outlined,
                    size: 20,
                  ),
                ),
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
