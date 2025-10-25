import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> userProfile = {
      "name": "Yelagani Madhusudhan Goud",
      "gender": "M",
      "age": 54,
      "employeeId": "YVS2025I3",
      "policy": "GMC YourVolta 24-25",
      "insurer": "Aditya Birla Health Insurance Co. Ltd",
      "policyNo": "2-81-24-0003521-000",
      "sumInsured": "500,000.00",
      "uhid": "PT36754254",
      "validity": "16-Nov-2024 To 15-Nov-2025",
      "insuredMembers": [
        {"name": "Yelagani Prameela Devi", "age": 80, "gender": "F", "relation": "Mother"},
        {"name": "Yelagani Nagakumari", "age": 51, "gender": "F", "relation": "Spouse"},
        {"name": "Yelagani Madhusudhan Goud", "age": 54, "gender": "M", "relation": "Self"},
      ]
    };

    const Color primaryColor = Color.fromARGB(255, 9, 15, 84);

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FC),
      

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          // 🧾 Profile Header Card
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 3,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  userProfile["name"],
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Divider(),
                const SizedBox(height: 8),
                _infoRow("Gender / Age", "${userProfile["gender"]} / ${userProfile["age"]}"),
                _infoRow("Employee ID", userProfile["employeeId"]),
                _infoRow("Policy", userProfile["policy"]),
                _infoRow("Insurer", userProfile["insurer"]),
                _infoRow("Policy No.", userProfile["policyNo"]),
                _infoRow("Sum Insured", "₹ ${userProfile["sumInsured"]}"),
                _infoRow("UHID", userProfile["uhid"]),
                _infoRow("Validity", userProfile["validity"]),
              ]),
            ),
          ),

          const SizedBox(height: 25),

          // 👨‍👩‍👧 Insured Members Section
          const Text(
            "Insured Members",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w700, color: primaryColor),
          ),
          const SizedBox(height: 12),
          ...List.generate(userProfile["insuredMembers"].length, (index) {
            final member = userProfile["insuredMembers"][index];
            return Card(
              elevation: 2,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              margin: const EdgeInsets.symmetric(vertical: 6),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: primaryColor.withOpacity(0.1),
                  child: Icon(
                    member["gender"] == "M" ? Icons.male : Icons.female,
                    color: primaryColor,
                  ),
                ),
                title: Text(
                  member["name"],
                  style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                ),
                subtitle: Text(
                  "Age: ${member["age"]} yrs | Relation: ${member["relation"]}",
                  style: const TextStyle(fontSize: 13),
                ),
              ),
            );
          }),

          const SizedBox(height: 30),

          // 🔒 Reset Password Section
          const Center(
            child: Text(
              "Reset Password",
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.w700, color: primaryColor),
            ),
          ),
          const SizedBox(height: 10),

          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 3,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(children: [
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Enter Password",
                    prefixIcon: const Icon(Icons.lock_outline),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Confirm Password",
                    prefixIcon: const Icon(Icons.lock),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    onPressed: () {
                      // TODO: Reset password API
                    },
                    child: const Text(
                      "Submit",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                    ),
                  ),
                ),
              ]),
            ),
          ),

          const SizedBox(height: 50),

          // ⚖️ Disclaimer Section
          const Text(
            "Disclaimer",
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w700, color: Color(0xFF2C2C30)),
          ),
          const SizedBox(height: 8),
          const Text(
            "All the information provided in this App is procured from various sources. "
            "Apex Insurance and all the associated third-party apps don’t accept any responsibility "
            "or liability for the accuracy, content, completeness, legality, or reliability of the "
            "information contained in this app. However, if you find any discrepancy pertaining to "
            "any information contained in this app, please mail to ",
            style: TextStyle(fontSize: 13.5, color: Colors.black87, height: 1.5),
          ),
          GestureDetector(
            onTap: () {
              // TODO: Open email intent
            },
            child: const Text(
              "info@apexinsurance.co.in",
              style: TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                  fontSize: 13.5,
                  fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(height: 25),
        ]),
      ),
    );
  }

  Widget _infoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Text(
              "$title:",
              style: const TextStyle(
                  fontWeight: FontWeight.w600, color: Colors.black87, fontSize: 14),
            ),
          ),
          Expanded(
            flex: 5,
            child: Text(
              value,
              style: const TextStyle(color: Colors.black87, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
