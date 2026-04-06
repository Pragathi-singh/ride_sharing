import 'package:flutter/material.dart';
import '../widgets/ride_card.dart';
import 'ride_list_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FA),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section
              Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 30),
                decoration: const BoxDecoration(
                  color: Color(0xFF243B6B),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Good Evening, Pragathi',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Where are you going today?',
                              style: TextStyle(
                                color: Color(0xFFD8DCE8),
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),

                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const Icon(
                            Icons.person,
                            color: Colors.white,
                            size: 28,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 25),

                    // Search Bar
                    GestureDetector(
                      onTap: () {
                        // Open Ride List Screen Later
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 15,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Row(
                          children: [
                            Icon(
                              Icons.search,
                              color: Color(0xFF6D6D6D),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                'Search destination, pickup point...',
                                style: TextStyle(
                                  color: Color(0xFF6D6D6D),
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            Icon(
                              Icons.location_on,
                              color: Color(0xFF7C4DFF),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              // Book Ride + Create Ride Buttons
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: buildActionButton(
                        title: 'Book Ride',
                        icon: Icons.directions_car,
                        backgroundColor: const Color(0xFF7C4DFF),
                        textColor: Colors.white,
                        onTap: () {
                          // Navigator.push to RideListScreen
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RideListScreen(),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: buildActionButton(
                        title: 'Create Ride',
                        icon: Icons.add_road,
                        backgroundColor: Colors.white,
                        textColor: const Color(0xFF243B6B),
                        borderColor: const Color(0xFF243B6B),
                        onTap: () {
                          // Navigator.push to CreateRideScreen
                        },
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // Popular Destinations
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Popular Destinations',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1F1F1F),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              SizedBox(
                height: 110,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  children: [
                    buildDestinationCard('Swargate', '12 rides available'),
                    buildDestinationCard('Katraj', '8 rides available'),
                    buildDestinationCard('FC Road', '15 rides available'),
                    buildDestinationCard('Railway Station', '5 rides available'),
                    buildDestinationCard('Hostel', '10 rides available'),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // Recent Rides
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Recent Rides',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1F1F1F),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    RideCard(
                      driverName: 'Rahul Patil',
                      from: 'VIT Pune',
                      to: 'Swargate',
                      time: 'Yesterday • 5:30 PM',
                      price: '₹50',
                      seats: '3 Seats Left',
                      isGirlsOnly: false,
                    ),

                    RideCard(
                      driverName: 'Priya Sharma',
                      from: 'Hostel',
                      to: 'FC Road',
                      time: 'Today • 4:00 PM',
                      price: '₹70',
                      seats: '2 Seats Left',
                      isGirlsOnly: true,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 90),
            ],
          ),
        ),
      ),

      bottomNavigationBar: Container(
        height: 75,
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
            ),
          ],
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomNavItem(
              icon: Icons.home,
              title: 'Home',
              isSelected: true,
            ),
            BottomNavItem(
              icon: Icons.directions_car,
              title: 'My Rides',
              isSelected: false,
            ),
            BottomNavItem(
              icon: Icons.notifications,
              title: 'Alerts',
              isSelected: false,
            ),
            BottomNavItem(
              icon: Icons.person,
              title: 'Profile',
              isSelected: false,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildActionButton({
    required String title,
    required IconData icon,
    required Color backgroundColor,
    required Color textColor,
    Color? borderColor,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 18),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(18),
          border: borderColor != null
              ? Border.all(color: borderColor, width: 1.5)
              : null,
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            Icon(icon, color: textColor, size: 30),
            const SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDestinationCard(String place, String rides) {
    return Container(
      width: 140,
      margin: const EdgeInsets.only(right: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFF7C4DFF).withOpacity(0.15),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.location_on,
              color: Color(0xFF7C4DFF),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            place,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Color(0xFF1F1F1F),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            rides,
            style: const TextStyle(
              color: Color(0xFF6D6D6D),
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

class BottomNavItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool isSelected;

  const BottomNavItem({
    super.key,
    required this.icon,
    required this.title,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: isSelected
              ? const Color(0xFF7C4DFF)
              : const Color(0xFF9E9E9E),
        ),
        const SizedBox(height: 4),
        Text(
          title,
          style: TextStyle(
            fontSize: 12,
            color: isSelected
                ? const Color(0xFF7C4DFF)
                : const Color(0xFF9E9E9E),
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}