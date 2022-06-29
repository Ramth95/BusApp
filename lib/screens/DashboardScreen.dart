import 'package:bus_test/Components/colors.dart';
import 'package:bus_test/Components/constants.dart';
import 'package:bus_test/Components/urls.dart';
import 'package:bus_test/Models/busListModel.dart';
import 'package:bus_test/screens/DriverList.dart';
import 'package:bus_test/screens/LoginScreen.dart';
import 'package:bus_test/services/api.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final dioService = DioClient();
  List<BusList> busList = [];

  @override
  void initState() {
    super.initState();
    getBuslist();
  }

  getBuslist() async {
    busList = await dioService.list_bus();
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
                      title: const Text('Do You want to Logout?'),
                      actions: [
                        TextButton(
                            onPressed: () {
                              logout();
                            },
                            child: const Text('yes')),
                        TextButton(
                            onPressed: () {
                              return Navigator.pop(context);
                            },
                            child: const Text('No')),
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
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Text('${busList.length} Bus Found'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: busList.length,
                itemBuilder: (context, index) {
                  print('${busList[index].name}');
                  return CardList(
                    title: busList[index].name,
                    subtitle: busList[index].type,
                    image:
                        'http://flutter.noviindus.co.in' + busList[index].image,
                  );
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
