import 'package:byrte_app/provider/userProvider.dart';
import 'package:byrte_app/screens/homepage.dart';
import 'package:byrte_app/screens/warning.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoading = false;

  // User? _user;
  // UserClassOperations operate = UserClassOperations();
  // UserClass u = UserClass.login(userMail: '', userPassword: '');
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _obscurePassword = true;

  @override
  void initState() {
    super.initState();
  }

  void showFloatingWarning(String message) {
    final overlay = Overlay.of(context, rootOverlay: true);

    if (overlay == null) {
      debugPrint("No overlay found in context!");
      return;
    }

    OverlayEntry overlayEntry = OverlayEntry(
      builder: (context) => FloatingWarning(message: message),
    );

    // Insert overlay
    overlay.insert(overlayEntry);

    // Remove after 2 sec
    Future.delayed(const Duration(seconds: 2), () {
      overlayEntry.remove();
    });
  }

  String? _validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return "Required";
    } else if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
        .hasMatch(value)) {
      return "Enter a valid email address";
    }
    return null; // No error
  }

  String? _validateLoginPassword(String? value) {
      // Check if password is empty
      if (value == null || value.isEmpty) {
        return "Required";
      }
      return null; // No error
    }

  // Future<void> _submitForm() async {
  //   isLoading = true;
  //   setState(() {});
  //   u.userMail = _emailController.text.trim();
  //   u.userPassword = _passwordController.text.trim();
  //   final form = _formKey.currentState;
  //   if (form!.validate()) {
  //     print("Valid Form");
  //     int a = await operate.login(u);
  //     if (a == 1) {
  //       Provider.of<userProvider>(context, listen: false).setValue(u.userMail!);
  //       Provider.of<userProvider>(context, listen: false)
  //           .setPass(u.userPassword!);
  //       print(Provider.of<userProvider>(context, listen: false).email);
  //       isLoading = false;
  //       setState(() {});
  //       Navigator.pushReplacement(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) => HomePage(),
  //         ),
  //       );
  //     } else {
  //       isLoading = false;
  //       setState(() {});
  //       showFloatingWarning("Incorrect credentials");
  //     }
  //   } else {
  //     isLoading = false;
  //     setState(() {});
  //     print("Error in form");
  //   }
  // }

  // Future<void> registerUserAfterGoogleSignIn(String email) async {
  //   try {
  //     UserClass? fetchedUser = await operate.getUser(email);

  //     if (fetchedUser == null) {
  //       UserClass _user1 = UserClass.login(userMail: email);
  //       // If the user doesn't exist in Firestore, register them
  //       await operate.create(_user1);

  //       print("User registered successfully in Firestore.");
  //     } else {
  //       print("User already exists in Firestore.");
  //     }
  //   } catch (e) {
  //     print("Error registering user in Firestore: $e");
  //   }
  // }

  // Future<dynamic> signInWithGoogle() async {
  //   try {
  //     // **Ensure previous user session is cleared before new login**
  //     await FirebaseAuth.instance.signOut();
  //     isLoading = true;
  //     setState(() {}); // Trigger a rebuild to show loading indicator

  //     GoogleAuthProvider _authprovider = GoogleAuthProvider();
  //     _authprovider.addScope('email').setCustomParameters(
  //         {'prompt': 'select_account'}); // Forces account selection

  //     final UserCredential userCredential =
  //         await FirebaseAuth.instance.signInWithProvider(_authprovider);

  //     _user = userCredential.user;

  //     if (_user != null) {
  //       print("Google Sign-In successful:");
  //       print("Profile Data: ${userCredential.toString()}");
  //       print("Name: ${_user!.displayName}");
  //       print("Email: ${_user!.email}");

  //       // **Ensure provider updates immediately**
  //       Provider.of<userProvider>(context, listen: false)
  //           .setValue(_user!.email!);

  //       await registerUserAfterGoogleSignIn(_user!.email!);

  //       isLoading = false;
  //       setState(() {}); // Trigger a rebuild to hide loading indicator
  //       // **Navigate after provider update**
  //       Navigator.pushReplacement(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) => HomePage(),
  //         ),
  //       );
  //     }
  //   } catch (e) {
  //     print("Error during Google Sign-In: $e");
  //     _user = null;
  //   }
  // }

  // Future<bool> signOutFromGoogle() async {
  //   try {
  //     await _auth.signOut();
  //     setState(() {
  //       _user = null; // Clear the user after sign-out
  //     });
  //     return true;
  //   } on Exception catch (_) {
  //     return false;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, // ✅ keyboard pushes content up
      body: Stack(
        children: [
          // Positioned.fill(
          //   child: Image.asset(
          //     'assets/images/bg.png',
          //     fit: BoxFit.cover, // cover entire screen
          //   ),
          // ),
          // ✅ Foreground content (scrollable)
          isLoading
              ? Center(child: CircularProgressIndicator())
              : Form(
                key: _formKey,
                child: SafeArea(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(24.0),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: MediaQuery.of(context).size.height -
                            MediaQuery.of(context).padding.top -
                            MediaQuery.of(context).padding.bottom,
                      ),
                      child: IntrinsicHeight(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const SizedBox(height: 100),

                            // Title
                            const Text(
                              "LOGIN",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 9, 15, 84),
                              ),
                            ),

                            const SizedBox(height: 40),

                            // Email Field
                            TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              controller: _emailController,
                              validator: _validateUsername,
                              keyboardType: TextInputType.emailAddress,
                              style: const TextStyle(color:Color.fromARGB(255, 9, 15, 84)),
                              decoration: InputDecoration(
                                labelText: "Email",
                                labelStyle:
                                    const TextStyle(color: Color.fromARGB(255, 32, 30, 30)),
                                prefixIcon: const Icon(Icons.email,
                                    color: Color.fromARGB(255, 9, 15, 84)),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide:
                                      const BorderSide(color: Color.fromARGB(255, 9, 15, 84)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide:
                                      const BorderSide(color: Color.fromARGB(255, 9, 15, 84)),
                                ),
                              ),
                            ),

                            const SizedBox(height: 20),

                            // Password Field
                            TextFormField(
                              controller: _passwordController,
                              validator: _validateLoginPassword,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              obscureText: _obscurePassword,
                              style: const TextStyle(color: Color.fromARGB(255, 25, 24, 24)),
                              decoration: InputDecoration(
                                labelText: "Password",
                                labelStyle:
                                    const TextStyle(color:Color.fromARGB(255, 9, 15, 84)),
                                prefixIcon:
                                    const Icon(Icons.lock, color:Color.fromARGB(255, 9, 15, 84)),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _obscurePassword
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: Color.fromARGB(255, 9, 15, 84),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _obscurePassword = !_obscurePassword;
                                    });
                                  },
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide:
                                      const BorderSide(color: Color.fromARGB(255, 9, 15, 84)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide:
                                      const BorderSide(color:Color.fromARGB(255, 9, 15, 84)),
                                ),
                              ),
                            ),

                            const SizedBox(height: 40),

                            // Login Button
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomePage(),
                                  ),
                                );
                                // _submitForm();
                              },
                              style: ElevatedButton.styleFrom(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
                                backgroundColor:Color.fromARGB(255, 9, 15, 84),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: const Text(
                                "Login",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                ),
                              ),
                            ),

                            const SizedBox(height: 2),

                            // Register Redirect
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/register');
                                  },
                                  child: const Text(
                                    "Forgot Password?",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color:Color.fromARGB(255, 9, 15, 84),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            

                            
                          ],
                        ),
                      ),
                    ),
                  ),
                ),),

          
        ],
      ),
    );
  }
}
