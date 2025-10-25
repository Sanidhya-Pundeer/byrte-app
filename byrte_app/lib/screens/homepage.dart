
import 'package:byrte_app/screens/claim_form_page.dart';
import 'package:byrte_app/screens/help_support_page.dart';
import 'package:byrte_app/screens/landing_page.dart';
import 'package:byrte_app/screens/profile_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Genuine Insurance',
      theme: ThemeData(
        primaryColor:Color.fromARGB(255, 9, 15, 84),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const MainScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    LandingPage(),
    ClaimFormPage(),
    HelpSupportPage(),
    ProfilePage(),
  ];

  final List<String> _titles = [
    "Genuine Insurance",
    "Claim Form",
    "Help & Support",
    "Profile",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _titles[_currentIndex],
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 9, 15, 84),
      ),
      body: _screens[_currentIndex],

      // ✅ Modern Material 3 NavigationBar
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) =>
            setState(() => _currentIndex = index),
        indicatorColor: const Color.fromARGB(255, 9, 15, 84).withOpacity(0.1),
        backgroundColor: Colors.white,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home, color: Color.fromARGB(255, 9, 15, 84)),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.description_outlined),
            selectedIcon: Icon(Icons.description, color: Color.fromARGB(255, 9, 15, 84)),
            label: 'Claim Form',
          ),
          NavigationDestination(
            icon: Icon(Icons.help_outline),
            selectedIcon: Icon(Icons.help, color: Color.fromARGB(255, 9, 15, 84)),
            label: 'Help',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person, color: Color.fromARGB(255, 9, 15, 84)),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
