import 'package:flutter/material.dart';

class AlertsScreen extends StatelessWidget {
  const AlertsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FA),
      appBar: AppBar(
        title: const Text('Alerts'),
        backgroundColor: const Color(0xFF243B6B),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Ride Updates Section
            const Text(
              'Ride Updates',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF243B6B),
              ),
            ),
            const SizedBox(height: 15),

            buildAlertCard(
              icon: Icons.directions_car,
              title: 'Driver Arriving Soon',
              message: 'Your driver Rahul Patil is 4 minutes away',
              time: '2 minutes ago',
              iconColor: const Color(0xFF7C4DFF),
            ),

            const SizedBox(height: 12),

            buildAlertCard(
              icon: Icons.check_circle,
              title: 'Ride Completed',
              message: 'Your ride to Swargate has been completed',
              time: '1 hour ago',
              iconColor: Colors.green,
            ),

            const SizedBox(height: 12),

            buildAlertCard(
              icon: Icons.payment,
              title: 'Payment Confirmed',
              message: '₹70 has been deducted from your account',
              time: '1 hour ago',
              iconColor: Colors.blue,
            ),

            const SizedBox(height: 30),

            // Offers & Notifications Section
            const Text(
              'Offers & Updates',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF243B6B),
              ),
            ),
            const SizedBox(height: 15),

            buildAlertCard(
              icon: Icons.local_offer,
              title: '20% Off on Your Next Ride',
              message: 'Use code SAVE20 to get 20% discount',
              time: 'Today',
              iconColor: Colors.orange,
            ),

            const SizedBox(height: 12),

            buildAlertCard(
              icon: Icons.star,
              title: 'Rate Your Last Ride',
              message: 'Help us improve by rating your experience',
              time: '2 hours ago',
              iconColor: Colors.amber,
            ),

            const SizedBox(height: 12),

            buildAlertCard(
              icon: Icons.info,
              title: 'App Update Available',
              message: 'Update to the latest version for new features',
              time: 'Yesterday',
              iconColor: const Color(0xFF7C4DFF),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget buildAlertCard({
    required IconData icon,
    required String title,
    required String message,
    required String time,
    required Color iconColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: iconColor, size: 24),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF243B6B),
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  message,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  time,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
