// ignore_for_file: file_names

import 'package:bus_test/Components/colors.dart';
import 'package:bus_test/Components/constants.dart';
import 'package:bus_test/screens/DashboardScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: height / 3,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/login_1.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        title: Column(
          children: [
            Text(
              "Welcome",
              style: GoogleFonts.firaSans(
                textStyle:
                    const TextStyle(fontSize: 50, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text("Manage your Bus and Drivers",
                style: GoogleFonts.firaSans(
                    textStyle: const TextStyle(fontSize: 15))),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                TextField(
                  decoration: newInputdecoration('Enter Username'),
                ),
                Newheight(newheight: 10),
                TextField(
                  decoration: newInputdecoration('Enter Password'),
                ),
              ],
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  primary: colorPrimary,
                  minimumSize: Size(width, 50)),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: ((context) => DashboardScreen())));
              },
              child: ButtonText(button: 'Login',),
            ),
          ],
        ),
      ),
    );
  }
}


