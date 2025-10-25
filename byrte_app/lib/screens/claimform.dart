import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For date formatting

class ClaimScreen extends StatefulWidget {
  const ClaimScreen({super.key});

  @override
  State<ClaimScreen> createState() => _ClaimScreenState();
}

class _ClaimScreenState extends State<ClaimScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color.fromARGB(255, 9, 15, 84);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 3,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Claim Form",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white70,
          tabs: const [
            Tab(text: 'Notify Claim'),
            Tab(text: 'Claim Status'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          ClaimFormContent(),
          Center(
            child: Text(
              "Claim Status - No data to display yet.",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}

class ClaimFormContent extends StatefulWidget {
  const ClaimFormContent({super.key});

  @override
  State<ClaimFormContent> createState() => _ClaimFormContentState();
}

class _ClaimFormContentState extends State<ClaimFormContent> {
  // Dummy Data
  final List<String> memberNames = [
    'John Doe (Self)',
    'Jane Smith (Spouse)',
    'Child 1',
    'Parent 1'
  ];

  final List<String> claimTypes = [
    'Cashless',
    'Reimbursement',
    'Pre-Authorization'
  ];

  String? selectedMember;
  String? selectedClaimType;
  DateTime? selectedDate;

  final TextEditingController uhidController = TextEditingController();
  final TextEditingController hospitalController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController treatmentController = TextEditingController();

  // Utility widget for displaying static employee details
  Widget _buildStaticDetail(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              "$label:",
              style: const TextStyle(fontSize: 15, color: Colors.black54),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              value,
              style: const TextStyle(
                  fontSize: 15, fontWeight: FontWeight.w600, color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }

  // Generic rounded text field
  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    int maxLines = 1,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        controller: controller,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Colors.black54),
          filled: true,
          fillColor: Colors.grey.shade100,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  // Dropdown field
  Widget _buildDropdown({
    required String label,
    required String? value,
    required List<String> items,
    required void Function(String?) onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: DropdownButtonFormField<String>(
        value: value,
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: Colors.grey.shade100,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
        ),
        items: items
            .map((item) => DropdownMenuItem(value: item, child: Text(item)))
            .toList(),
        onChanged: onChanged,
      ),
    );
  }

  // Date picker field
  Widget _buildDateField(BuildContext context) {
    final String displayDate = selectedDate == null
        ? 'Select Admission Date'
        : DateFormat('dd-MMM-yyyy').format(selectedDate!);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        onTap: () async {
          final DateTime? picked = await showDatePicker(
            context: context,
            initialDate: selectedDate ?? DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2100),
            builder: (context, child) {
              return Theme(
                data: Theme.of(context).copyWith(
                  colorScheme: const ColorScheme.light(
                    primary: Color.fromARGB(255, 9, 15, 84),
                  ),
                ),
                child: child!,
              );
            },
          );
          if (picked != null) setState(() => selectedDate = picked);
        },
        child: InputDecorator(
          decoration: InputDecoration(
            labelText: 'Date of Admission',
            filled: true,
            fillColor: Colors.grey.shade100,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                displayDate,
                style: TextStyle(
                    fontSize: 15,
                    color: selectedDate == null
                        ? Colors.black54
                        : Colors.black87),
              ),
              const Icon(Icons.calendar_today_outlined,
                  color: Colors.black54, size: 20),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const String employeeName = 'Yelagani Madhusudhan Goud';
    const String employeeId = 'YVS2025I3';
    const String policyNo = '2-81-24-0003521-000';

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Employee details
          _buildStaticDetail('Employee Name', employeeName),
          _buildStaticDetail('Employee ID', employeeId),
          _buildStaticDetail('Policy No', policyNo),

          const SizedBox(height: 20),

          _buildDropdown(
            label: 'Member Name',
            value: selectedMember,
            items: memberNames,
            onChanged: (value) => setState(() => selectedMember = value),
          ),
          _buildTextField(label: 'UHD ID', controller: uhidController),
          _buildDropdown(
            label: 'Claim Type',
            value: selectedClaimType,
            items: claimTypes,
            onChanged: (value) => setState(() => selectedClaimType = value),
          ),
          _buildDateField(context),
          _buildTextField(label: 'Hospital', controller: hospitalController),
          _buildTextField(
              label: 'Hospital Address',
              controller: addressController,
              maxLines: 3),
          _buildTextField(
              label: 'Treatment', controller: treatmentController),

          const SizedBox(height: 30),

          // Submit button
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 9, 15, 84),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                elevation: 3,
              ),
              onPressed: () {
                // TODO: Add API submission
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Claim Submitted Successfully!")),
                );
              },
              child: const Text(
                'Submit',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
