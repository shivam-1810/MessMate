import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mess_app/pages/login_page.dart';
import 'package:slide_to_act/slide_to_act.dart';

class LetsStartPage extends StatelessWidget {
  const LetsStartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset(
              'assets/images/food_image.png',
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Welcome back',
                    style: GoogleFonts.averiaSerifLibre(
                      fontSize: 40,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Foodies',
                    style: GoogleFonts.pacifico(
                      fontSize: 45,
                      color: Color.fromRGBO(255, 183, 3, 1.0),
                    ),
                  ),
                  const Spacer(),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Builder(
                        builder: (context) {
                          final GlobalKey<SlideActionState> key = GlobalKey();

                          return SizedBox(
                            height: 64,
                            child: SlideAction(
                              key: key,
                              onSubmit: () {
                                Future.delayed(
                                    const Duration(milliseconds: 250), () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const LoginPage(),
                                    ),
                                  );
                                });
                                return;
                              },
                              outerColor: const Color.fromRGBO(255, 183, 3, 1),
                              innerColor: Colors.black,
                              elevation: 4,
                              animationDuration:
                                  const Duration(milliseconds: 350),
                              sliderButtonIcon: const Icon(Icons.arrow_forward,
                                  color: Colors.white),
                              text: 'Get Started!!',
                              textStyle: GoogleFonts.inter(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              borderRadius: 40,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
