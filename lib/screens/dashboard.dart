import 'package:choppa_app/widgets/food_card.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController locationController = TextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color.fromRGBO(245, 255, 253, 1),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                const Text(
                  'Welcome Hammed',
                  style: TextStyle(
                      fontFamily: 'CircularStd',
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: TextField(
                        controller: locationController,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.my_location),
                          hintText: '500 rivers state university road',
                          filled: true,
                          fillColor: const Color(0xFFE7FFF5),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none, // No border
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Image.asset(width: 40, 'assets/images/avatar.png'),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      color: const Color.fromRGBO(204, 255, 242, 0.49),
                      child: Stack(
                        children: [
                          const SizedBox(
                            height: 170,
                            width: 172,
                          ),
                          Positioned(
                            left: 60,
                            top: 40,
                            child:
                                Image.asset('assets/images/delivery-bike.png'),
                          ),
                          const Positioned(
                            left: 65,
                            top: 110,
                            child: Text(
                              'Logistics',
                              style: TextStyle(
                                fontFamily: 'CircularStd',
                                fontSize: 16,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      color: const Color.fromRGBO(255, 197, 0, 0.31),
                      child: Stack(
                        children: [
                          const SizedBox(
                            height: 170,
                            width: 172,
                          ),
                          Positioned(
                            left: 60,
                            top: 40,
                            child: Image.asset('assets/images/take-away.png'),
                          ),
                          const Positioned(
                            left: 45,
                            top: 110,
                            child: Text(
                              'Food Delivery',
                              style: TextStyle(
                                fontFamily: 'CircularStd',
                                fontSize: 16,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  color: const Color.fromRGBO(255, 238, 238, 1),
                  child: Stack(
                    children: [
                      const SizedBox(
                        height: 170,
                        width: 172,
                      ),
                      Positioned(
                        left: 60,
                        top: 40,
                        child: Image.asset('assets/images/restaurant.png'),
                      ),
                      const Positioned(
                        left: 15,
                        top: 110,
                        child: Text(
                          'Chopper Restaurant',
                          style: TextStyle(
                            fontFamily: 'CircularStd',
                            fontSize: 16,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Top food selected for by chopper',
                  style: TextStyle(
                    fontFamily: 'CircularStd',
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const FoodCard(
                  imagePath: 'assets/images/food.png',
                  title: 'Chopper - Rivers',
                  price: 'N2500',
                  status: 'Open',
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_basket_outlined),
          label: 'Orders',
        ),
        BottomNavigationBarItem(
            icon: CircleAvatar(
          radius: 18,

          child: Image.asset('assets/images/avatar.png'),
        ),
        label: 'Profile'
        )
      ]),
    );
  }
}
