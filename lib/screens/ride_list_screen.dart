import 'package:flutter/material.dart';
import '../widgets/ride_card.dart';
import 'ride_details_screen.dart';

class RideListScreen extends StatefulWidget {
  const RideListScreen({super.key});

  @override
  State<RideListScreen> createState() => _RideListScreenState();
}

class _RideListScreenState extends State<RideListScreen> {
  String selectedFilter = 'All';

  final TextEditingController fromController = TextEditingController();
  final TextEditingController toController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FA),

      appBar: AppBar(
        backgroundColor: const Color(0xFF243B6B),
        elevation: 0,
        title: const Text(
          'Available Rides',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Column(
        children: [
          // Top Search + Filter Section
          Container(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 25),
            decoration: const BoxDecoration(
              color: Color(0xFF243B6B),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Column(
              children: [
                // From Field
                TextField(
                  controller: fromController,
                  onChanged: (value) {
                    setState(() {});
                  },
                  decoration: InputDecoration(
                    hintText: 'From (Example: VIT Pune)',
                    hintStyle: const TextStyle(
                      color: Color(0xFF6D6D6D),
                    ),
                    prefixIcon: const Icon(
                      Icons.my_location,
                      color: Color(0xFF7C4DFF),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(vertical: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                // To Field
                TextField(
                  controller: toController,
                  onChanged: (value) {
                    setState(() {});
                  },
                  decoration: InputDecoration(
                    hintText: 'To (Example: Swargate)',
                    hintStyle: const TextStyle(
                      color: Color(0xFF6D6D6D),
                    ),
                    prefixIcon: const Icon(
                      Icons.location_on,
                      color: Color(0xFFE53935),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(vertical: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),

                const SizedBox(height: 18),

                // Filter Chips
                SizedBox(
                  height: 45,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    children: [
                      buildFilterChip('All'),
                      buildFilterChip('Girls Only'),
                      buildFilterChip('Verified'),
                      buildFilterChip('Cheapest'),
                      buildFilterChip('Nearest'),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 15),

          // Ride List
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                if (showRide(
                  from: 'VIT Pune',
                  to: 'Swargate',
                  isGirlsOnly: false,
                  type: 'Verified',
                ))
                  RideCard(
                    driverName: 'Rahul Patil',
                    from: 'VIT Pune',
                    to: 'Swargate',
                    time: 'Today • 5:30 PM',
                    price: '₹50',
                    seats: '3 Seats Left',
                    isGirlsOnly: false,
                    isVerified: true,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RideDetailsScreen(
                            driverName: 'Rahul Patil',
                            from: 'VIT Pune',
                            to: 'Swargate',
                            price: '₹50',
                            time: 'Today • 5:30 PM',
                            vehicle: 'Bike',
                            vehicleNumber: 'MH12 AB 1234',
                            pickupPoint: 'Main Gate, VIT Pune',
                            phoneNumber: '+91 9876543210',
                          ),
                        ),
                      );
                    },
                  ),

                if (showRide(
                  from: 'Hostel',
                  to: 'FC Road',
                  isGirlsOnly: true,
                  type: 'Girls Only',
                ))
                  RideCard(
                    driverName: 'Priya Sharma',
                    from: 'Hostel',
                    to: 'FC Road',
                    time: 'Today • 4:00 PM',
                    price: '₹70',
                    seats: '2 Seats Left',
                    isGirlsOnly: true,
                    isVerified: true,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RideDetailsScreen(
                            driverName: 'Priya Sharma',
                            from: 'Hostel',
                            to: 'FC Road',
                            price: '₹70',
                            time: 'Today • 4:00 PM',
                            vehicle: 'Scooty',
                            vehicleNumber: 'MH14 CD 4567',
                            pickupPoint: 'Girls Hostel Gate',
                            phoneNumber: '+91 9876501234',
                          ),
                        ),
                      );
                    },
                  ),

                if (showRide(
                  from: 'VIT Pune',
                  to: 'Railway Station',
                  isGirlsOnly: false,
                  type: 'Nearest',
                ))
                  RideCard(
                    driverName: 'Aman Verma',
                    from: 'VIT Pune',
                    to: 'Railway Station',
                    time: 'Today • 6:15 PM',
                    price: '₹90',
                    seats: '1 Seat Left',
                    isGirlsOnly: false,
                    isVerified: true,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RideDetailsScreen(
                            driverName: 'Aman Verma',
                            from: 'VIT Pune',
                            to: 'Railway Station',
                            price: '₹90',
                            time: 'Today • 6:15 PM',
                            vehicle: 'Car',
                            vehicleNumber: 'MH12 XY 8899',
                            pickupPoint: 'College Main Parking',
                            phoneNumber: '+91 9988776655',
                          ),
                        ),
                      );
                    },
                  ),

                if (showRide(
                  from: 'VIT Pune',
                  to: 'Katraj',
                  isGirlsOnly: false,
                  type: 'Cheapest',
                ))
                  RideCard(
                    driverName: 'Neha Kulkarni',
                    from: 'VIT Pune',
                    to: 'Katraj',
                    time: 'Today • 3:45 PM',
                    price: '₹30',
                    seats: '4 Seats Left',
                    isGirlsOnly: false,
                    isVerified: true,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RideDetailsScreen(
                            driverName: 'Neha Kulkarni',
                            from: 'VIT Pune',
                            to: 'Katraj',
                            price: '₹30',
                            time: 'Today • 3:45 PM',
                            vehicle: 'Auto',
                            vehicleNumber: 'MH12 TR 2244',
                            pickupPoint: 'VIT Front Gate',
                            phoneNumber: '+91 9123456789',
                          ),
                        ),
                      );
                    },
                  ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }

  bool showRide({
    required String from,
    required String to,
    required bool isGirlsOnly,
    required String type,
  }) {
    bool matchesFrom = fromController.text.isEmpty ||
        from.toLowerCase().contains(fromController.text.toLowerCase());

    bool matchesTo = toController.text.isEmpty ||
        to.toLowerCase().contains(toController.text.toLowerCase());

    bool matchesFilter = selectedFilter == 'All' ||
        (selectedFilter == 'Girls Only' && isGirlsOnly) ||
        selectedFilter == type ||
        selectedFilter == 'Verified';

    return matchesFrom && matchesTo && matchesFilter;
  }

  Widget buildFilterChip(String title) {
    bool isSelected = selectedFilter == title;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedFilter = title;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0xFF7C4DFF)
              : Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
            ),
          ],
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected
                ? Colors.white
                : const Color(0xFF243B6B),
            fontWeight: FontWeight.w600,
            fontSize: 13,
          ),
        ),
      ),
    );
  }
}