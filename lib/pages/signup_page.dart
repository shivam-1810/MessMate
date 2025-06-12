import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mess_app/components/login_signup_textfield.dart';
import 'package:intl/intl.dart';
import 'package:mess_app/pages/otp_verification_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController dobController = TextEditingController();
  final TapGestureRecognizer _tapGestureRecognizer = TapGestureRecognizer();

  @override
  void dispose() {
    _tapGestureRecognizer.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2003),
      firstDate: DateTime(1980),
      lastDate: DateTime.now(),
      builder: (context, child) => Theme(
        data: ThemeData.dark().copyWith(
          primaryColor: const Color.fromRGBO(255, 183, 3, 1),
          colorScheme: const ColorScheme.dark(
            primary: Color.fromRGBO(255, 183, 3, 1),
            surface: Color(0xFF2B2B2B),
            onSurface: Colors.white,
          ),
        ),
        child: child!,
      ),
    );

    if (picked != null) {
      setState(() {
        dobController.text = DateFormat('dd/MM/yyyy').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26.0, vertical: 16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 24),

                // Title
                Center(
                  child: Text(
                    'Sign up',
                    style: GoogleFonts.averiaSerifLibre(
                      fontSize: 36,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                Image.asset(
                  'assets/images/signup_image.png',
                  height: 200,
                ),

                const SizedBox(height: 30),

                // Fields
                loginSignupTextField(hintText: 'Name', obscureText: false),
                const SizedBox(height: 19),
                loginSignupTextField(
                    hintText: 'Father’s Name', obscureText: false),
                const SizedBox(height: 19),
                loginSignupTextField(
                    hintText: 'Contact No.', obscureText: false),
                const SizedBox(height: 19),
                loginSignupTextField(hintText: 'E mail', obscureText: false),
                const SizedBox(height: 19),

                // Date of birth field with icon
                TextField(
                  controller: dobController,
                  readOnly: true,
                  onTap: _pickDate,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "Date of birth",
                    hintStyle: GoogleFonts.poppins(
                        color: Colors.white70, fontSize: 20),
                    filled: true,
                    fillColor: const Color.fromRGBO(83, 82, 82, 0.77),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                      borderSide: const BorderSide(
                        color: Color.fromRGBO(255, 255, 255, 0.36),
                        width: 2,
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 16),
                    suffixIcon:
                        const Icon(Icons.calendar_today, color: Colors.white70),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),

                const SizedBox(height: 19),
                loginSignupTextField(
                    hintText: 'Hostel Roll No.', obscureText: false),
                const SizedBox(height: 19),
                loginSignupTextField(hintText: 'Room No.', obscureText: false),
                const SizedBox(height: 19),
                loginSignupTextField(
                    hintText: 'Department', obscureText: false),

                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const OTPVerificationPage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(255, 183, 3, 1),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 4,
                    ),
                    child: Text(
                      "Next",
                      style: GoogleFonts.inter(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: RichText(
                    text: TextSpan(
                      text: "Already have an account? ",
                      style: GoogleFonts.poppins(
                          color: Colors.white70, fontSize: 16),
                      children: [
                        TextSpan(
                          text: "Log in",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer: _tapGestureRecognizer
                            ..onTap = () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignUpPage(),
                                ),
                              );
                            },
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // // Next button at bottom right
                // Align(
                //   alignment: Alignment.centerRight,
                //   child: ElevatedButton(
                //     onPressed: () {
                //       // Handle navigation
                //     },
                //     style: ElevatedButton.styleFrom(
                //       backgroundColor: const Color.fromRGBO(255, 183, 3, 1),
                //       padding: const EdgeInsets.symmetric(
                //           horizontal: 26, vertical: 14),
                //       shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(30),
                //       ),
                //       elevation: 4,
                //     ),
                //     child: Text(
                //       "Next",
                //       style: GoogleFonts.inter(
                //         fontSize: 20,
                //         fontWeight: FontWeight.bold,
                //         color: Colors.black,
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
