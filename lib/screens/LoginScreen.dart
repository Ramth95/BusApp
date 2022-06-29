// ignore_for_file: file_names


import 'package:bus_test/Components/colors.dart';
import 'package:bus_test/Components/constants.dart';
import 'package:bus_test/screens/DashboardScreen.dart';
import 'package:bus_test/services/api.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final dioService = DioClient();

  late String id;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextField(
                    controller: _usernameController,
                    decoration: newInputdecoration('Enter Username'),
                  ),
                  Newheight(newheight: 10),
                  TextField(
                    obscureText: true,
                    controller: _passwordController,
                    decoration: newInputdecoration('Enter Password'),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  primary: colorPrimary,
                  minimumSize: Size(width, 50)),
              onPressed: () {
                signin();
              },
              child: ButtonText(
                button: 'Login',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future signin() async {
    var username = _usernameController.text;
    var password = _passwordController.text;
    var response = await dioService.login(username, password);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => DashboardScreen()));    
  }

  // Future<void> signin() async {
  //   try {
  //     if (_passwordController.text.isNotEmpty &&
  //         _usernameController.text.isNotEmpty) {
  //       var response = await http.post(
  //           Uri.parse("http://flutter.noviindus.co.in/api/LoginApi"),
  //           body: ({
  //             'username': _usernameController.text,
  //             'password': _passwordController.text
  //           }));
  //       print(response.statusCode);
  //        final decodedvalue ;
  //       if (response.statusCode == 200) {
  //         final String body = response.body;
  //         print(body);
  //         decodedvalue = jsonDecode(body);
  //         final token = decodedvalue['access'];
  //         print(token);
  //         //id = decodedvalue['urlid'];
  //         //print(id);
  //         pageRoute(token);
  //         print('fn called');

  //       }
  //       else if(response.statusCode==401){
  //         final response2 = await http.post(Uri.parse('http://flutter.noviindus.co.in/api/api/token/refresh/'),
  //         body: ({
  //             'refresh':''
  //           }),
  //         headers: {'grant_type': 'refresh_token', 'refresh_token': ''});
  //         var refresh_token = jsonDecode(response2.body)['refresh'];
  //         print(refresh_token);
  //         return signin();
  //       }
  //     }
  //   } catch (exception) {
  //     print(exception.toString());
  //   }
  // }

  void pageRoute(String token) async {
    SharedPreferences prefer = await SharedPreferences.getInstance();
    await prefer.setString("access", token);
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => DashboardScreen()),
        (route) => false);
  }
}
