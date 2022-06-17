import 'package:bus_test/Components/colors.dart';
import 'package:bus_test/Components/constants.dart';
import 'package:bus_test/screens/DriverList.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

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
}
