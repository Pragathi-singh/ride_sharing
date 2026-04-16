import 'package:flutter/material.dart';

class SafetyScreen extends StatelessWidget {
  SafetyScreen({super.key});

  final List<Map<String, String>> contacts = [
    {"name": "Mom", "phone": "9876543210"},
    {"name": "Friend", "phone": "9123456780"},
  ];

  final List<Map<String, String>> helplines = [
    {"name": "Police", "phone": "100"},
    {"name": "Women Helpline", "phone": "1091"},
    {"name": "Ambulance", "phone": "102"},
  ];

  void showCall(BuildContext context, String name, String number) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Row(
            children: const [
              Icon(Icons.call, color: Colors.deepPurple),
              SizedBox(width: 10),
              Text("Calling"),
            ],
          ),
          content: Text("$name ($number)..."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                "Cancel",
                style: TextStyle(color: Colors.indigo),
              ),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade50,
      appBar: AppBar(
        title: const Text("Safety"),
        backgroundColor: Colors.indigo,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Emergency Contacts",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: [
                  ...contacts.map((c) {
                    return Card(
                      child: ListTile(
                        title: Text(c["name"]!),
                        subtitle: Text(c["phone"]!),
                        trailing: IconButton(
                          icon: const Icon(Icons.call, color: Colors.indigo),
                          onPressed: () {
                            showCall(context, c["name"]!, c["phone"]!);
                          },
                        ),
                      ),
                    );
                  }),
                  const SizedBox(height: 20),
                  const Text(
                    "Helpline Numbers",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ...helplines.map((h) {
                    return Card(
                      child: ListTile(
                        title: Text(h["name"]!),
                        subtitle: Text(h["phone"]!),
                        trailing: IconButton(
                          icon: const Icon(Icons.call, color: Colors.indigo),
                          onPressed: () {
                            showCall(context, h["name"]!, h["phone"]!);
                          },
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}