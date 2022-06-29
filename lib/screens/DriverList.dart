import 'package:bus_test/Components/constants.dart';
import 'package:bus_test/Models/driverListModel.dart';
import 'package:bus_test/screens/AddDriver.dart';
import 'package:bus_test/services/api.dart';
import 'package:flutter/material.dart';

import '../Components/colors.dart';

class DriverList extends StatefulWidget {
  const DriverList({Key? key}) : super(key: key);

  @override
  State<DriverList> createState() => _DriverListState();
}

class _DriverListState extends State<DriverList> {
  final dioService = DioClient();
  List<DriverListElement> driver_list = [];

  @override
  void initState() {
    super.initState();
    getDriverList();
  }

  getDriverList() async {
    driver_list = await dioService.list_driver();
  }

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
            Text('${driver_list.length} drivers found'),
            Expanded(
              child: ListView.separated(
                itemCount: driver_list.length,
                itemBuilder: (context, index) {
                  return CardList(
                      title: driver_list[index].name,
                      subtitle: 'Lic:no: ${driver_list[index].licenseNo}',
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
