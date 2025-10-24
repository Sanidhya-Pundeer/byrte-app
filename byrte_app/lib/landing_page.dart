import 'package:flutter/material.dart';
import 'network_hospitals_page.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = const Color(0xFFFF6600);
    final Color iconColor = Colors.orange.shade700;

    // Add 'image' field for each card
    final List<Map<String, dynamic>> gridItems = [
      {
        'icon': Icons.local_hospital_outlined,
        'label': 'Network Hospitals',
        'image': 'assets/images/hospital.png',
      },
      {
        'icon': Icons.credit_card,
        'label': 'e-Card',
        'image': 'assets/images/e-card.png',
      },
      {
        'icon': Icons.request_page_outlined,
        'label': 'Claim',
        'image': 'assets/images/claim.png',
      },
      {
        'icon': Icons.description_outlined,
        'label': 'Claim Form',
        'image': 'assets/images/claim_form.png',
      },
      {
        'icon': Icons.favorite,
        'label': 'Wellness',
        'image': 'assets/images/wellness.png',
      },
      {
        'icon': Icons.slideshow_outlined,
        'label': 'Policy Presentation',
        'image': 'assets/images/policy_presentation.png',
      },
      {
        'icon': Icons.checklist_outlined,
        'label': 'Claim Document Check List',
        'image': 'assets/images/document_checklist.png',
      },
      {
        'icon': Icons.article_outlined,
        'label': 'Sample Claim Form',
        'image': 'assets/images/sample_claim_form.png',
      },
      {
        'icon': Icons.security,
        'label': 'Policy Coverage & Exclusions',
        'image': 'assets/images/policy_coverage.png',
      },
      {
        'icon': Icons.assignment_turned_in_outlined,
        'label': 'Claim Process',
        'image': 'assets/images/claim_process.png',
      },
    ];

    return SafeArea(
      child: Column(
        children: [
          // Header
          Container(
            color: primaryColor,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: const Text(
              "Hello, John Doe",
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          // Logo
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/company-logo.png',
                  height: 100,
                  color: iconColor,
                ),
                const SizedBox(height: 8),
                const Text(
                  "Insurance Broking Services Pvt. Ltd.",
                  style: TextStyle(color: Colors.black54, fontSize: 14),
                ),
              ],
            ),
          ),

          // Grid
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 18,
                  crossAxisSpacing: 18,
                  childAspectRatio: 1.1,
                ),
                itemCount: gridItems.length,
                itemBuilder: (context, index) {
                  final item = gridItems[index];
                  return Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: InkWell(
                      onTap: () {
                        if (item['label'] == 'Network Hospitals') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const NetworkHospitalsPage(),
                            ),
                          );
                        }
                      },
                      borderRadius: BorderRadius.circular(12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Use specific image for each card
                          Image.asset(
                            item['image'],
                            height: 70,
                            color: iconColor,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            item['label'],
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
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
    );
  }
}
