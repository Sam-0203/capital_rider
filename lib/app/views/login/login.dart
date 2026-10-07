import 'package:country_code_picker/country_code_picker.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:flutter/material.dart';
import 'package:ride_now/app/views/root_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController mobileController = TextEditingController();

  String countryCode = "+91";
  int mobileLength = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F7),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Column(
            children: [
              const SizedBox(height: 15),

              /// Logo
              Image.asset("assets/icons/image.png", width: 70, height: 70),

              const SizedBox(height: 8),

              const Text(
                "RideNow",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),

              const SizedBox(height: 25),

              /// Login Card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.05),
                      blurRadius: 15,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Welcome back",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    const SizedBox(height: 10),

                    const Text(
                      "Log in to your account to book your next ride.",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 25),

                    const Text(
                      "Enter Mobile Number",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const SizedBox(height: 12),

                    /// Phone Field
                    Container(
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.black),
                      ),
                      child: Row(
                        children: [
                          CountryCodePicker(
                            initialSelection: "IN",
                            favorite: const ["+91", "IN"],
                            showCountryOnly: false,
                            showOnlyCountryWhenClosed: false,
                            alignLeft: false,
                            onChanged: (value) {
                              countryCode = value.dialCode ?? "+91";
                            },
                          ),

                          Container(
                            width: 1,
                            height: 25,
                            color: Colors.grey.shade300,
                          ),

                          Expanded(
                            child: TextField(
                              controller: mobileController,
                              keyboardType: TextInputType.phone,
                              maxLength: 10,
                              decoration: const InputDecoration(
                                counterText: "",
                                border: InputBorder.none,
                                hintText: "Mobile Number",
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 15,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    /// Continue Button
                    SizedBox(
                      width: double.infinity,
                      height: 54,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        onPressed: () {
                          // String mobile = mobileController.text.trim();

                          // if (mobile.length != mobileLength) {
                          //   ScaffoldMessenger.of(context).showSnackBar(
                          //     SnackBar(
                          //       content: Text(
                          //         "Enter a valid $mobileLength digit mobile number",
                          //       ),
                          //     ),
                          //   );
                          //   return;
                          // }

                          // String phoneNumber = "$countryCode$mobile";

                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RootScreen(),
                            ),
                            (route) => false,
                          );
                          // Navigate OTP Screen
                        },
                        child: const Text(
                          "Continue",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 25),

                    /// Divider
                    Row(
                      children: [
                        Expanded(child: Divider(color: Colors.grey.shade300)),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: Text(
                            "Or continue with",
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Expanded(child: Divider(color: Colors.grey.shade300)),
                      ],
                    ),

                    const SizedBox(height: 25),

                    /// Social Login
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton.icon(
                            style: OutlinedButton.styleFrom(
                              minimumSize: const Size(double.infinity, 52),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                            ),
                            onPressed: () {
                              /// Google Login
                            },
                            icon: const Icon(
                              Icons.g_mobiledata,
                              size: 30,
                              color: Colors.black,
                            ),
                            label: const Text(
                              "Google",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(width: 12),

                        Expanded(
                          child: OutlinedButton.icon(
                            style: OutlinedButton.styleFrom(
                              minimumSize: const Size(double.infinity, 52),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                            ),
                            onPressed: () {
                              /// Apple Login
                            },
                            icon: const Icon(Icons.apple, color: Colors.black),
                            label: const Text(
                              "Apple",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              /// Terms
              RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 14,
                    height: 1.6,
                  ),
                  children: [
                    TextSpan(text: "By proceeding, you agree to our "),
                    TextSpan(
                      text: "Privacy Policy",
                      style: TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(text: " and "),
                    TextSpan(
                      text: "Terms of Service",
                      style: TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(text: "."),
                  ],
                ),
              ),

              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}
