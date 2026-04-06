import 'package:flutter/material.dart';
import 'live_map_screen.dart';

class RideDetailsScreen extends StatelessWidget {
  final String driverName;
  final String from;
  final String to;
  final String price;
  final String time;
  final String vehicle;
  final String vehicleNumber;
  final String pickupPoint;
  final String phoneNumber;

  const RideDetailsScreen({
    super.key,
    required this.driverName,
    required this.from,
    required this.to,
    required this.price,
    required this.time,
    required this.vehicle,
    required this.vehicleNumber,
    required this.pickupPoint,
    required this.phoneNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FA),

      appBar: AppBar(
        backgroundColor: const Color(0xFF243B6B),
        elevation: 0,
        title: const Text(
          'Ride Details',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Driver Card
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 32,
                    backgroundColor: const Color(0xFF243B6B),
                    child: Text(
                      driverName[0],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(width: 18),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          driverName,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1F1F1F),
                          ),
                        ),

                        const SizedBox(height: 10),

                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFC8E6C9),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text(
                            'Verified Student',
                            style: TextStyle(
                              color: Color(0xFF2E7D32),
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Ride Information Card
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Column(
                children: [
                  buildDetailRow(
                    icon: Icons.route,
                    title: 'Route',
                    value: '$from  →  $to',
                  ),

                  const Divider(height: 30),

                  buildDetailRow(
                    icon: Icons.access_time,
                    title: 'Time',
                    value: time,
                  ),

                  const Divider(height: 30),

                  buildDetailRow(
                    icon: Icons.currency_rupee,
                    title: 'Price',
                    value: price,
                  ),

                  const Divider(height: 30),

                  buildDetailRow(
                    icon: Icons.directions_car,
                    title: 'Vehicle',
                    value: '$vehicle • $vehicleNumber',
                  ),

                  const Divider(height: 30),

                  buildDetailRow(
                    icon: Icons.location_on,
                    title: 'Pickup Point',
                    value: pickupPoint,
                  ),

                  const Divider(height: 30),

                  buildDetailRow(
                    icon: Icons.phone,
                    title: 'Phone Number',
                    value: phoneNumber,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // Bottom Buttons
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 58,
                    child: ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),

                              title: const Row(
                                children: [
                                  Icon(
                                    Icons.check_circle,
                                    color: Color(0xFF2EB67D),
                                  ),
                                  SizedBox(width: 10),
                                  Text('Ride Booked'),
                                ],
                              ),

                              content: Text(
                                'Your ride with $driverName from $from to $to has been booked successfully.',
                                style: const TextStyle(
                                  fontSize: 15,
                                ),
                              ),

                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);

                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                        const LiveMapScreen(),
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    'Track Ride',
                                    style: TextStyle(
                                      color: Color(0xFF7C4DFF),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF7C4DFF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                      child: const Text(
                        'Book Ride',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 12),

                Container(
                  height: 58,
                  width: 58,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(
                      color: const Color(0xFF243B6B),
                    ),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.call,
                      color: Color(0xFF243B6B),
                    ),
                  ),
                ),

                const SizedBox(width: 12),

                Container(
                  height: 58,
                  width: 58,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(
                      color: const Color(0xFF243B6B),
                    ),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.chat,
                      color: Color(0xFF243B6B),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDetailRow({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFF7C4DFF).withOpacity(0.12),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Icon(
            icon,
            color: const Color(0xFF7C4DFF),
            size: 24,
          ),
        ),

        const SizedBox(width: 15),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Color(0xFF6D6D6D),
                  fontSize: 13,
                ),
              ),

              const SizedBox(height: 4),

              Text(
                value,
                style: const TextStyle(
                  color: Color(0xFF1F1F1F),
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}