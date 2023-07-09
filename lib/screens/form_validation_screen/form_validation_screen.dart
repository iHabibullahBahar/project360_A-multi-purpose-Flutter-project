import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class FormValidationScreen extends StatelessWidget {
  FormValidationScreen({super.key});

  TextEditingController emailCtr = TextEditingController();
  TextEditingController passCtr = TextEditingController();

  String? validateEmail(String? value) {
    const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
    final regex = RegExp(pattern);

    return value!.isNotEmpty && !regex.hasMatch(value)
        ? 'Enter a valid email address'
        : null;
  }

  String? validatePass(String? value) {
    if (value.toString().length < 6) {
      return "Password is less than 6 letters";
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Login with Email and Password",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.roboto(
                        textStyle: const TextStyle(fontSize: 25))),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                    width: 300,
                    child: Form(
                      autovalidateMode: AutovalidateMode.always,
                      child: TextFormField(
                        controller: emailCtr,
                        validator: validateEmail,
                        decoration:
                            const InputDecoration(hintText: "Type Email"),
                      ),
                    )),
                SizedBox(
                    width: 300,
                    child: Form(
                      autovalidateMode: AutovalidateMode.always,
                      child: TextFormField(
                        validator: validatePass,
                        controller: passCtr,
                        obscureText: true,
                        decoration:
                            const InputDecoration(hintText: "Type Password"),
                      ),
                    )),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      Get.snackbar("Success", "You are logged in",
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.green);
                    },
                    child: const Text("Login with Password"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
