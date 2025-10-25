import 'package:flutter/material.dart';
import 'network_hospitals_page.dart';
import 'claimform.dart';
import 'ecard.dart';
import 'claim_form_page.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = const Color.fromARGB(255, 9, 15, 84);
    final Color accentColor = const Color.fromARGB(255, 40, 45, 102);

    final List<Map<String, dynamic>> gridItems = [
      {
        'label': 'Network Hospitals',
        'image': 'assets/images/hospital.png',
      },
      {
        'label': 'E-Card',
        'image': 'assets/images/e-card.png',
      },
      {
        'label': 'Claim',
        'image': 'assets/images/claim.png',
      },
      {
        'label': 'Claim Form',
        'image': 'assets/images/claim_form.png',
      },
      {
        'label': 'Wellness',
        'image': 'assets/images/wellness.png',
      },
      {
        'label': 'Policy Presentation',
        'image': 'assets/images/policy_presentation.png',
      },
      {
        'label': 'Claim Document \nCheck List',
        'image': 'assets/images/document_checklist.png',
      },
      {
        'label': 'Sample Claim Form',
        'image': 'assets/images/sample_claim_form.png',
      },
      {
        'label': 'Policy Coverage & Exclusions',
        'image': 'assets/images/policy_coverage.png',
      },
      {
        'label': 'Claim Process',
        'image': 'assets/images/claim_process.png',
      },
    ];

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Column(
          children: [
            // ✅ Header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(22),
                  bottomRight: Radius.circular(22),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Hello, John Doe",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  // 🔹 Logout IconButton instead of ElevatedButton.icon
                  IconButton(
                    onPressed: () {
                      // TODO: Implement logout logic
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.logout,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                ],
              ),
            ),

            // ✅ Logo & Title
            Container(
              margin: const EdgeInsets.only(top: 20, bottom: 10),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/company-logo.png',
                    height: 85,
                    color: accentColor,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Insurance Broking Services Pvt. Ltd.",
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),

            // ✅ Grid Section
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 1.05,
                  ),
                  itemCount: gridItems.length,
                  itemBuilder: (context, index) {
                    final item = gridItems[index];

                    return InkWell(
                      borderRadius: BorderRadius.circular(14),
                      onTap: () {
                        if (item['label'] == 'Network Hospitals') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const NetworkHospitalsPage()),
                          );
                        } else if (item['label'] == 'E-Card') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Ecard()),
                          );
                        } else if (item['label'] == 'Claim') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ClaimScreen()),
                          );
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(14),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.15),
                              blurRadius: 6,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(14),
                              decoration: BoxDecoration(
                                color: primaryColor.withOpacity(0.08),
                                shape: BoxShape.circle,
                              ),
                              child: Image.asset(
                                item['image'],
                                height: 50,
                                color: primaryColor,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              item['label'],
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 13.5,
                                fontWeight: FontWeight.w600,
                                color: Color.fromARGB(255, 40, 40, 60),
                                height: 1.3,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
