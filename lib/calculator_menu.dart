// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tanihara/calculator_fertilizer.dart';
import 'package:tanihara/calculator_npk.dart';

class calculatorMenu extends StatefulWidget {
  const calculatorMenu({Key? key}) : super(key: key);

  @override
  _calculatorMenuState createState() => _calculatorMenuState();
}

class _calculatorMenuState extends State<calculatorMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(height: 20),
        IconButton(
            icon: const Icon(Icons.arrow_back, color: Color(0xFF545454)),
            onPressed: () => Navigator.of(context).pop()),
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Calculator',
                  style: GoogleFonts.inter(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff209556)),
                ),
                SizedBox(height: 5),
                Text(
                  'Calculate Your Plant',
                  style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: Color(0xff545454)),
                ),
                SizedBox(height: 50),
                Container(
                    width: 500,
                    height: 121,
                    decoration: BoxDecoration(
                      color: Color(0xFFF5F5F5), //warna background box
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 0,
                          blurRadius: 5,
                          offset: Offset(0, 5),
                        )
                      ],
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 75),
                        Center(
                            child: Column(children: [
                          SizedBox(
                            height: 10,
                          ),
                          Image(
                            image: AssetImage('assets/image/Vector.png'),
                            fit: BoxFit.cover,
                            height: 50,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Fertilizer PPM Calculator',
                            style: GoogleFonts.inter(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff209556)),
                          ),
                        ])),
                        SizedBox(width: 35),
                        Material(
                          type: MaterialType.transparency,
                          child: Ink(
                            decoration: BoxDecoration(
                              color: Color(0xFF888888).withOpacity(0.3),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(10.0),
                              onTap: () {
                                Route route = MaterialPageRoute(
                                    builder: (context) =>
                                        (ConvertFertilizerScreen()));
                                Navigator.push(context, route);
                              },
                              child: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Icon(
                                  Icons.keyboard_arrow_right_rounded,
                                  size: 20.0,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    )),
                SizedBox(height: 30),
                Container(
                    width: 500,
                    height: 121,
                    decoration: BoxDecoration(
                      color: Color(0xFFF5F5F5), //warna background box
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 0,
                          blurRadius: 5,
                          offset: Offset(0, 5),
                        )
                      ],
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 40),
                        Center(
                            child: Column(children: [
                          SizedBox(
                            height: 10,
                          ),
                          Image(
                            image: AssetImage(
                                'assets/image/simple-icons_convertio.png'),
                            fit: BoxFit.cover,
                            height: 50,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'NPK and N-P205-K20 Converter',
                            style: GoogleFonts.inter(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff209556)),
                          ),
                        ])),
                        Material(
                          type: MaterialType.transparency,
                          child: Ink(
                            decoration: BoxDecoration(
                              color: Color(0xFF888888).withOpacity(0.3),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(10.0),
                              onTap: () {
                                Route route = MaterialPageRoute(
                                    builder: (context) => (calculatorNPK()));
                                Navigator.push(context, route);
                              },
                              child: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Icon(
                                  Icons.keyboard_arrow_right_rounded,
                                  size: 20.0,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    )),
              ],
            )),
      ]),
    )));
  }
}
