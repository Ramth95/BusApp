import 'package:bus_test/Components/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Busseats extends StatefulWidget {
  const Busseats({Key? key}) : super(key: key);

  @override
  _BusseatsState createState() => _BusseatsState();
}

class _BusseatsState extends State<Busseats> {
  var _chairStatus = [
    [1, 1, 1, 1, 1, 1, 1],
    [1, 1, 1, 1, 3, 1, 1],
    [1, 1, 1, 1, 1, 3, 3],
    [2, 2, 2, 1, 3, 1, 1],
    [1, 1, 1, 1, 1, 1, 1],
    [1, 1, 1, 1, 1, 1, 1],
    [1, 1, 1, 1, 1, 1, 1],
    [1, 1, 1, 1, 1, 1, 1],
    [1, 1, 1, 1, 1, 1, 1],
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('KSRTC Bus'),
        centerTitle: true,
        toolbarHeight: height / 7,
        backgroundColor: colorSecondary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Card(
              color: colorSecondary,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: ListTile(
                title: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 5, 5),
                  child: Text(
                    'Rohit Sharma',
                    style: GoogleFonts.firaSans(
                      textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 5, 5),
                  child: Text(
                    'License no: 123456',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                trailing: Image(
                  image: AssetImage('assets/driver.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black)),
                child: Column(
                  children: <Widget>[
                    for (int i = 0; i < 9; i++)
                      Container(
                        margin: EdgeInsets.only(top: i == 0 ? 50 : 0),
                        child: Row(
                          children: <Widget>[
                            for (int x = 1; x < 7; x++)
                              Expanded(
                                child: (x == 3) || (x == 4)
                                    ? Container()
                                    : Container(
                                        margin: EdgeInsets.all(5),
                                        child: _chairStatus[i][x - 1] == 1
                                            ? availableChair(i, x - 1)
                                            : _chairStatus[i][x - 1] == 2
                                                ? selectedChair(i, x - 1)
                                                : reservedChair(),
                                      ),
                              ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget selectedChair(int a, int b) {
    return InkWell(
        onTap: () {
          _chairStatus[a][b] = 1;
          setState(() {});
        },
        child: Image(
          image: AssetImage('assets/seat_red.png'),
        ));
  }

  Widget availableChair(int a, int b) {
    return InkWell(
        onTap: () {
          _chairStatus[a][b] = 2;
          setState(() {});
        },
        child: Image(
          image: AssetImage('assets/seat_black.png'),
        ));
  }

  Widget reservedChair() {
    return Image(
      image: AssetImage('assets/seat_grey.png'),
    );
  }
}
