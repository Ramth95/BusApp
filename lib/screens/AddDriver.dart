import 'package:bus_test/Components/colors.dart';
import 'package:bus_test/Components/constants.dart';
import 'package:flutter/material.dart';

class AddDriver extends StatelessWidget {
  const AddDriver({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Driver'),
        centerTitle: true,
        toolbarHeight: height / 7,
        backgroundColor: colorSecondary,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                TextField(
                  decoration: newInputdecoration('Enter Name'),
                ),
                Newheight(newheight: 10),
                TextField(
                  decoration: newInputdecoration('Enter License Number'),
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
                // Navigator.of(context).push(MaterialPageRoute(
                //     builder: ((context) => DashboardScreen())));
              },
              child: ButtonText(
                button: 'Save',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
