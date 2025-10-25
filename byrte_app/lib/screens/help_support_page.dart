import 'package:flutter/material.dart';

class HelpSupportPage extends StatelessWidget {
  const HelpSupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: const Color(0xFFF7F8FC),
        appBar: AppBar(
  elevation: 0,
  backgroundColor: Colors.white,
  title: const Text(
    "Genuine Insurance Pvt. Ltd.",
    style: TextStyle(
      fontSize: 18,
      color: Color.fromARGB(255, 9, 15, 84),
      fontWeight: FontWeight.w700,
    ),
  ),
  centerTitle: true,
  bottom: const TabBar(
    indicatorColor: Color.fromARGB(255, 9, 15, 84),
    indicatorWeight: 3.0, // Thickness of underline
    labelColor: Color.fromARGB(255, 9, 15, 84),
    unselectedLabelColor: Colors.black54,
    labelStyle: TextStyle(fontWeight: FontWeight.w600),
    unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
    tabs: [
      Tab(text: "Claims Team"),
      Tab(text: "App Support"),
    ],
  ),
),
        body: const TabBarView(
          children: [
            ClaimsTeamView(),
            AppSupportView(),
          ],
        ),
      ),
    );
  }
}

class ClaimsTeamView extends StatelessWidget {
  const ClaimsTeamView({super.key});

  final List<Map<String, dynamic>> claimsTeamData = const [
    {
      "name": "Mrs. Veena",
      "mobile": "8008258844",
      "email": "eb.claims@apexinsurance.co.in",
      "initial": "L1"
    },
    {
      "name": "Mr. Vijayendher",
      "mobile": "9962269391",
      "email": "jvreddy@apexinsurance.co.in",
      "initial": "L2"
    },
    {
      "name": "Mr. Phaneendra",
      "mobile": "9949534888",
      "email": "chandavolu.phaneendra@adityabirla.com",
      "initial": "L3"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView.builder(
        itemCount: claimsTeamData.length,
        itemBuilder: (context, index) {
          final item = claimsTeamData[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.15),
                  blurRadius: 8,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              leading: CircleAvatar(
                radius: 22,
                backgroundColor: const Color.fromARGB(255, 9, 15, 84),
                child: Text(
                  item["initial"],
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              title: Text(
                item["name"],
                style: const TextStyle(
                    fontWeight: FontWeight.w600, color: Colors.black87),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 4),
                  Text(item["mobile"]),
                  Text(item["email"], style: const TextStyle(fontSize: 13)),
                ],
              ),
              trailing: IconButton(
                icon: const Icon(Icons.call, color: Colors.green),
                onPressed: () {},
              ),
            ),
          );
        },
      ),
    );
  }
}

class AppSupportView extends StatelessWidget {
  const AppSupportView({super.key});

  final Map<String, dynamic> userSupportInfo = const {
    "name": "Yelagani Madhusudhan Goud",
    "mobile": "9246227777",
    "email": "madhu@voltcabs.com",
  };

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _infoCard("Name", userSupportInfo["name"]),
            _infoCard("Mobile", userSupportInfo["mobile"]),
            _infoCard("Email", userSupportInfo["email"]),
            const SizedBox(height: 18),
            const Text(
              "Message",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
            ),
            const SizedBox(height: 8),
            TextField(
              maxLines: 3,
              decoration: InputDecoration(
                hintText: "Type your message here...",
                filled: true,
                fillColor: Colors.white,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 18),
            Row(
              children: [
                const Icon(Icons.attach_file, color: Colors.grey),
                const SizedBox(width: 8),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Add Attachment",
                    style: TextStyle(color: Color.fromARGB(255, 9, 15, 84)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 9, 15, 84),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  "Submit",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _infoCard(String title, String value) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              title,
              style: const TextStyle(
                  fontWeight: FontWeight.w600, color: Colors.black87),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              value,
              style: const TextStyle(color: Colors.black54),
            ),
          ),
        ],
      ),
    );
  }
}
