import 'package:bus_test/Components/colors.dart';
import 'package:bus_test/Components/constants.dart';
import 'package:bus_test/screens/DriverList.dart';
import 'package:bus_test/screens/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    super.initState();
    getcred();
  }

  late String token;
  Future<void> getcred() async {
    SharedPreferences prefer = await SharedPreferences.getInstance();
    setState(() {
      token = prefer.getString('access')!;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: height / 7,
        flexibleSpace: Padding(
          padding:
              EdgeInsets.fromLTRB(width / 4, height / 7 / 2, width / 4, 10),
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/logo.png'),
              ),
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Do You want to Logout?'),
                      actions: [
                        TextButton(
                            onPressed: () {
                              logout();
                            },
                            child: Text('yes')),
                        TextButton(
                            onPressed: () {
                              return Navigator.pop(context);
                            },
                            child: Text('No')),
                      ],
                    );
                  });
            },
            icon: const Icon(Icons.logout_rounded),
            color: Colors.yellow,
          ),
        ],
        backgroundColor: colorSecondary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: NewCard(
                    newImage: 'assets/bus.png',
                    name: 'Bus',
                    bgColor: colorPrimary,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => DriverList()));
                  },
                  child: NewCard(
                    newImage: 'assets/driver.png',
                    name: 'Driver',
                    bgColor: colorSecondary,
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text('Buses Found'),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return CardList(
                      title: 'KSRTC',
                      subtitle: 'Swift Scania p series',
                      image: 'assets/bus.png');
                },
                separatorBuilder: (context, index) {
                  return Newheight(newheight: 10);
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  void logout() async {
    SharedPreferences prefer = await SharedPreferences.getInstance();
    await prefer.clear();
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => LoginScreen()),
        (route) => false);
  }
}
