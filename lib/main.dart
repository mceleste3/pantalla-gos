//María Celeste Ortiz
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

// https://dribbble.com/shots/16450853-Pet-Adoption-Mobile-app

class Gos {
  String? imagename, especie, origen, temperament, tamany, fci;
  Gos({
    //parametros opcionales {}
    this.imagename,
    this.fci,
    this.especie,
    this.origen,
    this.temperament,
    this.tamany,
  });
}

class Gosinfo extends StatelessWidget {
  final gos1 = Gos(
    imagename: "yorkshire.jpg",
    especie: "Yorkshire Terrier",
    fci: "86",
    origen: "Anglaterra",
    tamany: "Petit",
    temperament:
        "Té molt potenciat l'instint de protecció positiu per estimular en els humans una actitud favorable cap a ells. És un gos d'una gran vivacitat i intel·ligència que pot arribar a intuir l'estat d'ànim del seu amo.",
  );
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                flex: 5,
                child: DogPreview(
                  imagename: gos1.imagename,
                )),
            Expanded(
                flex: 5,
                child: Doginfo(
                  especie: gos1.especie,
                  fci: gos1.fci,
                  origen: gos1.origen,
                  tamany: gos1.tamany,
                  temperament: gos1.temperament,
                ))
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(Gosinfo());
}

class Doginfo extends StatelessWidget {
  String? especie, origen, temperament, tamany, fci;
  Doginfo(
      {Key? key,
      required this.especie,
      required this.temperament,
      required this.fci,
      required this.origen,
      required this.tamany})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "$especie",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[850],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DogCharacteristic(
                  attribute: 'FCI',
                  value: fci,
                ),
                DogCharacteristic(
                  attribute: 'Origen',
                  value: origen,
                ),
                DogCharacteristic(
                  attribute: 'Tamany',
                  value: tamany,
                ),
              ],
            ),
            Text(
              "$temperament",
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey[600],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FloatingActionButton(
                  elevation: 20,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  backgroundColor: Colors.grey[50],
                  child: Transform.rotate(
                    angle: 5.4,
                    child: Icon(
                      Icons.send,
                      color: Colors.lightBlue[400],
                    ),
                  ),
                  onPressed: () {},
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 60,
                    vertical: 15,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.lightBlue[400],
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        offset: Offset(2, 2),
                        blurRadius: 3,
                      )
                    ],
                  ),
                  child: Text(
                    "Addopt",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class DogCharacteristic extends StatelessWidget {
  final String? attribute;
  final String? value;

  const DogCharacteristic({
    Key? key,
    required this.attribute,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 70,
      padding: EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.all(
          Radius.circular(25),
        ),
      ),
      child: Column(
        children: [
          Text(
            "$attribute",
            style: TextStyle(
              color: Colors.grey[500],
              fontWeight: FontWeight.w400,
            ),
          ),
          Spacer(),
          Text(
            "$value",
            style: TextStyle(
              color: Colors.lightBlue,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}

class DogPreview extends StatelessWidget {
  final String? imagename;
  const DogPreview({
    Key? key,
    required this.imagename,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[150],
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(30),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.arrow_back_ios,
                    color: Colors.grey[500],
                    size: 30,
                  ),
                  Icon(
                    Icons.favorite_border,
                    color: Colors.grey[500],
                    size: 30,
                  ),
                ]),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Image.asset(
                    "assets/$imagename",
                    fit: BoxFit.contain,
                    height: 250,
                  ),
                ),
                FloatingActionButton(
                  mini: true,
                  backgroundColor: Colors.yellow[700],
                  child: Icon(
                    Icons.female,
                    color: Colors.black,
                    size: 35,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
