import 'package:byrte_app/provider/userProvider.dart';
import 'package:byrte_app/screens/homepage.dart';
import 'package:byrte_app/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => userProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Insurance Brockering',
        theme: ThemeData(
          colorScheme:
              ColorScheme.fromSeed(seedColor:Color.fromARGB(255, 9, 15, 84)),
          useMaterial3: true,
        ),
        home: Consumer<userProvider>(
          builder: (context, userProvider, child) {
            return LoginPage();
          },
        ),
        routes: {
          '/home': (context) => HomePage(),
        },
      ),
    );
  }
}
