import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tsena/utility/large_butt.dart';
import 'package:tsena/utility/textformfield.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Text controllers
  final _searchController = TextEditingController();

  final List<Map<String, dynamic>> itemList = [
    {
      'price': 120.0,
      'star': 5,
      'reviews': 487,
      'shop': 'assets/images/amazon.png',
    },
    {
      'price': 199.99,
      'star': 4,
      'reviews': 928,
      'shop': 'assets/images/walmart.png',
    },
    {
      'price': 199.99,
      'star': 4,
      'reviews': 126,
      'shop': 'assets/images/ebay.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
      return Scaffold(
        backgroundColor: const Color(0xFF3B5998),
        resizeToAvoidBottomInset: true,
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Stack(
              children: [
                // First Positioned widget here
                Positioned(
                  left: 0.0,
                  right: 0.0,
                  top: 60.0,

                  // Column for first expanded widget items
                  child: Column(
                    children: [
                      // Row for compare icon and tsena text
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Compare icon
                          const Icon(Icons.compare_rounded,
                              color: Color(0xFFFFFFFF)),

                          // Tsena text
                          Text(
                            'Tsena',
                            style: GoogleFonts.inter(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFFFFFFFF),
                            ),
                          ),
                        ],
                      ),

                      // Textformfield for entering item for search
                      MyTextFormField(
                        labelText: 'Item name',
                        icon: Icons.search_rounded,
                        obscureText: false,
                        controller: _searchController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'This field is required';
                          }
                          return null;
                        },
                      ),

                      // Button for performing search
                      LargeButton(
                        icon: Icons.shopping_cart_rounded,
                        text: 'Search Item',
                        function: () {},
                      ),
                    ],
                  ),
                ),

                // Second Positioned widget here
                Positioned(
                  left: 0.0,
                  right: 0.0,
                  top: 300.0,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: const BoxDecoration(color: Color(0xFFF5F5F5)),
                  ),
                ),

                // Third Positioned widget for card (displaying details of single item)
                Positioned(
                  left: 0.0,
                  right: 0.0,
                  top: 260.0,

                  // Padding around container for displaying single item details
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),

                    // Container for displaying single item details
                    child: Container(
                      padding: const EdgeInsets.all(20.0),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(
                          color: const Color(0xFFD3D3D3),
                          width: 0.4,
                        ),
                      ),

                      // Column for displaying the item name, price and image
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // RichText for displaying the item name and price
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: GoogleFonts.inter(height: 1.2),
                              children: <TextSpan>[
                                TextSpan(
                                  text:
                                      '9 PLAY by Bang & Olufsen Beoplay H4 \n',
                                  style: GoogleFonts.inter(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF000000)),
                                ),
                                TextSpan(
                                  text: '\$99.99',
                                  style: GoogleFonts.inter(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF696969)),
                                ),
                              ],
                            ),
                          ),

                          // Image of item in a padding
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),

                            // Image of item here
                            child: Image.asset(
                              "assets/images/headset.png",
                              width: MediaQuery.of(context).size.width,
                              height: 200.0,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // Fourth Positioned for other items that match from other retailers
                Positioned(
                  left: 0.0,
                  right: 0.0,
                  bottom: 60.0,
                  child: SizedBox(
                    height: 220.0,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: itemList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                            top: 20.0,
                            left: 20.0,
                          ),
                          child: Container(
                            padding: const EdgeInsets.all(20.0),
                            width: 250.0,
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFFFFF),
                              borderRadius: BorderRadius.circular(5.0),
                              border: Border.all(
                                color: const Color(0xFFD3D3D3),
                                width: 0.4,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // Item shop
                                        Image.asset(
                                          itemList[index]['shop'],
                                          width: 60.0,
                                          fit: BoxFit.cover,
                                        ),

                                        // Item Price
                                        Text(
                                          '\$${itemList[index]['price']}',
                                          style: GoogleFonts.inter(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xFF696969)),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${itemList[index]['reviews']} REVIEWS',
                                          style: GoogleFonts.inter(
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xFFFF6F61),
                                            decoration:
                                                TextDecoration.underline,
                                            decorationColor: Color(0xFFFF6F61),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
