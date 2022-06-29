import 'package:bus_test/Components/busseats.dart';
import 'package:bus_test/Components/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Newheight extends StatelessWidget {
  Newheight({Key? key, required this.newheight}) : super(key: key);

  double newheight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: newheight,
    );
  }
}

InputDecoration newInputdecoration(String hintText) {
  return InputDecoration(
    filled: true,
    fillColor: Colors.grey.shade200,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    hintText: hintText,
  );
}

class NewCard extends StatelessWidget {
  NewCard(
      {Key? key,
      required this.newImage,
      required this.name,
      required this.bgColor})
      : super(key: key);

  String name;
  String newImage;
  Color bgColor;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: bgColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: GoogleFonts.firaSans(
                  textStyle: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25)),
            ),
            Text(
              'Manage Your $name',
              style: GoogleFonts.firaSans(
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 5,
              width: MediaQuery.of(context).size.width / 3,
              child: Image(
                image: AssetImage(newImage),
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardList extends StatelessWidget {
  CardList(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.image})
      : super(key: key);

  String title;
  String subtitle;
  String image;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(5, 10, 10, 5),
        child: ListTile(
          leading: SizedBox(
              height: 50, width: 50, child: Image(image: NetworkImage(image))),
          title: Text(title),
          subtitle: Text(subtitle),
          trailing: ElevatedButton(
            style: ElevatedButton.styleFrom(primary: colorPrimary),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Busseats()));
            },
            child: const Text('Manage'),
          ),
        ),
      ),
    );
  }
}

class ButtonText extends StatelessWidget {
  ButtonText({Key? key, required this.button}) : super(key: key);

  String button;
  @override
  Widget build(BuildContext context) {
    return Text(
      button,
      style: GoogleFonts.firaSans(
        textStyle: const TextStyle(fontSize: 20),
      ),
    );
  }
}
