import 'package:flutter/material.dart';
import 'school_booking.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _showGetStarted(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF2A1414),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) {
        return Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Book Pick n Drop Service",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Gilroy",
                          fontSize: 20,
                          //fontWeight: FontWeight.w600,
                        ),
                      ),
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.close, color: Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  _optionTile(
                    "Book For School",
                    () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SchoolRideBookingScreen()),
                      );
                    },
                  ),
                  _optionTile(
                    "For College/University",
                    () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SchoolRideBookingScreen()),
                      );
                    },
                  ),
                  _optionTile(
                    "For Office",
                    () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SchoolRideBookingScreen()),
                      );
                    },
                  ),
                  _optionTile(
                    "Family/Corporate Visit",
                    () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SchoolRideBookingScreen()),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ));
      },
    );
  }

  Widget _optionTile(String text, VoidCallback onTap) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: onTap,
        child: Container(
          width: 350,
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: Colors.white24),
          ),
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white70,
              fontFamily: "Gilroy",
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }

  Widget _featureCard() {
    return Container(
      width: 280,
      height: 240,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF2A1414),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 130,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(16),
              ),
              image: const DecorationImage(
                image: AssetImage('assets/images/car.jpg'),
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Safe & Vetted Drivers",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Gilroy",
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    "Reliable drivers verified for safety and professionalism.",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white60,
                      fontFamily: "Gilroylight",
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A0B0B),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Icon(Icons.directions_car,
                              color: Colors.white, size: 28),
                          Text(
                            "Trusty Wheels",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Gilroy",
                              fontSize: 22,
                              //fontWeight: FontWeight.w600,
                            ),
                          ),
                          Icon(Icons.menu, color: Colors.white, size: 28),
                        ],
                      ),
                      const SizedBox(height: 30),
                      const Text(
                        "Your Ride. Ride\nSimplified.",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Gilroy",
                          fontSize: 28,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Safe, reliable, and punctual pick-and-drop\nservice for students and professionals.",
                        style: TextStyle(
                          color: Colors.white70,
                          fontFamily: "Gilroylight",
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 220,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            _featureCard(),
                            _featureCard(),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Center(
                        child: Icon(Icons.more_horiz,
                            color: Colors.grey, size: 28),
                      ),
                      const SizedBox(height: 10),
                      GestureDetector(
                        onTap: () => _showGetStarted(context),
                        child: Container(
                          height: 52,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color(0xFFE50914),
                            borderRadius: BorderRadius.circular(26),
                          ),
                          child: const Center(
                            child: Text(
                              "Get Started",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Gilroy",
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 25),
                      const Text(
                        "Who We Serve",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Gilroy",
                          fontSize: 19,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: const Color(0xFF2A1414),
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: Column(
                                children: const [
                                  Icon(Icons.school,
                                      color: Color(0xFFE50914), size: 40),
                                  SizedBox(height: 10),
                                  Text(
                                    "Students",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Gilroy",
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                                  ),
                                  SizedBox(height: 6),
                                  Text(
                                    "Safe commutes for\nschool & university",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white60,
                                      fontFamily: "Gilroy",
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: const Color(0xFF2A1414),
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: Column(
                                children: const [
                                  Icon(Icons.work,
                                      color: Color(0xFFE50914), size: 40),
                                  SizedBox(height: 10),
                                  Text(
                                    "Working Women",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Gilroy",
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                                  ),
                                  SizedBox(height: 6),
                                  Text(
                                    "Reliable transport\nfor office & work",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white60,
                                      fontFamily: "Gilroy",
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      const Text(
                        "Our Features",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Gilroy",
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: const Color(0xFF2A1414),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Row(
                          children: const [
                            Icon(Icons.location_on,
                                color: Color(0xFFE50914), size: 32),
                            SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Door-To-Door Service",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Gilroy",
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    "We pick you up and drop you off right at your doorstep.",
                                    style: TextStyle(
                                      color: Colors.white60,
                                      fontFamily: "Gilroy",
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: const Color(0xFF2A1414),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Row(
                          children: const [
                            Icon(Icons.credit_card,
                                color: Color(0xFFE50914), size: 32),
                            SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Fixed Monthly Rates",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Gilroy",
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    "One payment for the whole month. No bargaining, no surprises.",
                                    style: TextStyle(
                                      color: Colors.white60,
                                      fontFamily: "Gilroy",
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
            ),

            // Fixed Footer with Get Started button
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Icon(Icons.dashboard, color: Color(0xFFE50914), size: 28),
                  Icon(Icons.route, color: Colors.white54, size: 28),
                  Icon(Icons.person, color: Colors.white54, size: 28),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
