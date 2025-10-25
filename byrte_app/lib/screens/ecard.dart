import 'package:flutter/material.dart';

// --- DUMMY DATA ---
// This list mimics the JSON structure you'd receive from an API.
const List<Map<String, dynamic>> _cardData = [
  {
    "uhidNo": "PT36754285",
    "name": "JANE DOE SMITH",
    "policyNo": "2-81-24-0003521-000",
    "policyPeriod": "16-Nov-2024 To 15-Nov-2025",
    "age": 80,
    "gender": "F",
    "companyName": "ACME TECHNOLOGY SOLUTIONS LIMITED",
    "empCode": "ACME2025I3"
  },
  {
    "uhidNo": "PT36754298",
    "name": "JOHN A. DOE",
    "policyNo": "2-81-24-0003521-001",
    "policyPeriod": "16-Nov-2024 To 15-Nov-2025",
    "age": 51,
    "gender": "M",
    "companyName": "ACME TECHNOLOGY SOLUTIONS LIMITED",
    "empCode": "ACME2025I4"
  },
  {
    "uhidNo": "PT36754254",
    "name": "ALICE WONDERLAND",
    "policyNo": "2-81-24-0003521-002",
    "policyPeriod": "16-Nov-2024 To 15-Nov-2025",
    "age": 29,
    "gender": "F",
    "companyName": "ACME TECHNOLOGY SOLUTIONS LIMITED",
    "empCode": "ACME2025I5"
  }
];

class Ecard extends StatelessWidget {
  const Ecard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Optional: Set a background color to match the subtle gray in the original image
      backgroundColor: const Color(0xFFF4F4F7), 
      appBar: AppBar(
        title: const Text('E-Cards'),
        backgroundColor:Color.fromARGB(255, 9, 15, 84),
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.separated(
            itemCount: _cardData.length,
            separatorBuilder: (context, index) => const SizedBox(height: 20),
            itemBuilder: (context, index) {
              return HealthCard(data: _cardData[index]);
            },
          ),
        ),
      ),
    );
  }
}

class HealthCard extends StatelessWidget {
  final Map<String, dynamic> data;
  const HealthCard({super.key, required this.data});

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.grey[700],
                fontSize: 14,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shadowColor: Colors.black26,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // --- Gradient Header ---
          Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              gradient: const LinearGradient(
                colors: [Color(0xFF353B82), Color(0xFF252B66)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'Generic Health Insurance Co. Ltd.',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.security,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ],
            ),
          ),

          // --- Main Content ---
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  'Digital Health Card',
                  style: TextStyle(
                    color: Colors.red[700],
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),

                // Details
                _buildDetailRow("UHID No", data["uhidNo"]),
                _buildDetailRow("Name", data["name"]),
                _buildDetailRow("Policy No.", data["policyNo"]),
                _buildDetailRow("Policy Period", data["policyPeriod"]),

                const SizedBox(height: 10),
                // Age & Gender pills
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      margin: const EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade50,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        'Age: ${data["age"]}',
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 14),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.green.shade50,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        'Gender: ${data["gender"]}',
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 14),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                _buildDetailRow("Company Name", data["companyName"]),
                _buildDetailRow("EMP Code", data["empCode"]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
