import 'package:bus_test/Components/constants.dart';
import 'package:bus_test/screens/AddDriver.dart';
import 'package:flutter/material.dart';

import '../Components/colors.dart';

class DriverList extends StatelessWidget {
  const DriverList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Driver List'),
        centerTitle: true,
        toolbarHeight: height / 7,
        backgroundColor: colorSecondary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Drivers found'),
            Expanded(
              child: ListView.separated(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return CardList(
                      title: 'Rohit Sharma',
                      subtitle: 'Lic:no: 123456',
                      image: 'assets/driver.png');
                },
                separatorBuilder: (context, index) {
                  return Newheight(newheight: 10);
                },
              ),
            ),
            Center(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      primary: colorPrimary,
                      minimumSize: Size(width, 50)),
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: ((context) => AddDriver())));
                  },
                  child: ButtonText(
                    button: 'Add Driver',
                  )),
            )
          ],
        ),
      ),
    );
  }
}
