// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tanihara/calculator_menu.dart';
import 'package:tanihara/model/user_model.dart';
import 'package:tanihara/notification.dart';
// import 'package:tanihara/historyscreen.dart';
// import 'package:tanihara/measurementscreen.dart';
// import 'package:tanihara/model/plant.dart';
// import 'package:tanihara_app/predictscreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  //String dropdownVal = datas[0].name;
  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    if (screenSize.width < 700) {
      // Mobile screen
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Row(children: [
                  CircleAvatar(
                      backgroundColor: Colors.white,
                      backgroundImage:
                          NetworkImage('${loggedInUser.image_url}'),
                      radius: 25),
                  SizedBox(width: 10),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hello,",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 17,
                          ),
                        ),
                        Text(
                          //nama user
                          '${loggedInUser.name}',
                          style: GoogleFonts.inter(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff209556)),
                        ),
                      ]),
                ]),
                IconButton(
                    color: const Color(0xFF06AA50),
                    onPressed: () => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => notification()))
                        },
                    icon: const Icon(Icons.notifications_outlined))
              ]),
              const SizedBox(height: 18),
              Center(
                child: Card(
                  elevation: 2,
                  clipBehavior: Clip.hardEdge,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Container(
                    height: 104,
                    width: 248,
                    child: const Center(
                      child: Text("Sunday, 31 July 2002",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 19)),
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                              "https://c0.wallpaperflare.com/preview/652/943/804/close-up-fresh-freshness-garden.jpg")),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 18),
              Center(
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card(
                        elevation: 2,
                        color: const Color.fromARGB(255, 244, 244, 244),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: InkWell(
                          onTap: () {
                            // Navigator.push(
                            //         context,
                            //         MaterialPageRoute(
                            //             builder: (context) =>
                            //                 MeasurementScreen()))
                            //     .then((value) => {setState(() {})});
                          },
                          borderRadius: BorderRadius.circular(15),
                          child: SizedBox(
                            width: 134,
                            height: 71,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Icon(
                                      Icons.exposure,
                                      size: 30,
                                      color: Color(0xFF06AA50),
                                    ),
                                    Text("Measure"),
                                  ]),
                            ),
                          ),
                        ),
                      ),
                      Card(
                        elevation: 2,
                        color: const Color.fromARGB(255, 244, 244, 244),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: InkWell(
                          onTap: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => HistoryScreen()));
                          },
                          borderRadius: BorderRadius.circular(15),
                          child: SizedBox(
                            width: 134,
                            height: 71,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Icon(
                                      Icons.history,
                                      size: 30,
                                      color: Color(0xFF06AA50),
                                    ),
                                    Text("History"),
                                  ]),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card(
                        elevation: 2,
                        color: const Color.fromARGB(255, 244, 244, 244),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => calculatorMenu()));
                          },
                          borderRadius: BorderRadius.circular(15),
                          child: SizedBox(
                            width: 134,
                            height: 71,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Icon(
                                      Icons.calculate,
                                      size: 30,
                                      color: Color(0xFF06AA50),
                                    ),
                                    Text("Calculator"),
                                  ]),
                            ),
                          ),
                        ),
                      ),
                      Card(
                        elevation: 2,
                        color: const Color.fromARGB(255, 244, 244, 244),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: InkWell(
                          onTap: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => PredictScreen()));
                          },
                          borderRadius: BorderRadius.circular(15),
                          child: SizedBox(
                            width: 134,
                            height: 71,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Icon(
                                      Icons.online_prediction,
                                      size: 30,
                                      color: Color(0xFF06AA50),
                                    ),
                                    Text("Predict"),
                                  ]),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ]),
              ),
              const SizedBox(height: 19),
              Text(
                "Weekly Report",
                style: TextStyle(
                    color: Color(0xFF06AA50),
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 5),
                    // Card(
                    //   elevation: 2,
                    //   shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(15)),
                    //   child: SizedBox(
                    //     width: 308,
                    //     height: 327,
                    //     child: Stack(
                    //       children: [
                    //         Positioned(
                    //           top: 10,
                    //           left: 10,
                    //           child: Container(
                    //             decoration: BoxDecoration(
                    //                 borderRadius: BorderRadius.circular(20)),
                    //             width: 134,
                    //             child: DropdownButtonFormField<String>(
                    //               value: dropdownVal,
                    //               decoration: InputDecoration(
                    //                 isDense: true,
                    //                 contentPadding: const EdgeInsets.symmetric(
                    //                     vertical: 5, horizontal: 10),
                    //                 filled: true,
                    //                 fillColor: const Color.fromARGB(
                    //                     255, 219, 236, 220),
                    //                 enabledBorder: OutlineInputBorder(
                    //                   borderRadius: BorderRadius.circular(20),
                    //                   borderSide: const BorderSide(
                    //                       width: 0.0,
                    //                       color: Colors.transparent),
                    //                 ),
                    //                 focusedBorder: OutlineInputBorder(
                    //                   borderRadius: BorderRadius.circular(20),
                    //                   borderSide: const BorderSide(
                    //                       width: 0.0,
                    //                       color: Colors.transparent),
                    //                 ),
                    //               ),
                    //               dropdownColor:
                    //                   const Color.fromARGB(255, 219, 236, 220),
                    //               items: datasNames
                    //                   .map<DropdownMenuItem<String>>(
                    //                       (String value) {
                    //                 return DropdownMenuItem<String>(
                    //                   value: value,
                    //                   child: Text(value),
                    //                 );
                    //               }).toList(),
                    //               onChanged: (String? newVal) {
                    //                 setState(() {
                    //                   dropdownVal = newVal!;
                    //                 });
                    //               },
                    //             ),
                    //           ),
                    //         ),
                    //         Positioned(
                    //             left: 10,
                    //             top: 82,
                    //             child: Column(
                    //               crossAxisAlignment: CrossAxisAlignment.start,
                    //               children: const [
                    //                 Text(
                    //                   "CALCULATION",
                    //                   style: TextStyle(
                    //                       color: Color(0xFF06AA50),
                    //                       fontSize: 10),
                    //                 ),
                    //                 Text(
                    //                   "293,9 Ppm",
                    //                   style: TextStyle(
                    //                       color: Color(0xFF06AA50),
                    //                       fontSize: 30,
                    //                       fontWeight: FontWeight.w500),
                    //                 ),
                    //               ],
                    //             )),
                    //         Positioned(
                    //             top: 120,
                    //             child: Image(
                    //                 image: AssetImage("images/vector1_1.png"))),
                    //         Positioned(
                    //             top: 120,
                    //             child: Image(
                    //                 image: AssetImage("images/vector1_2.png"))),
                    //       ],
                    //     ),
                    //   ),
                    // )
                  ],
                ),
              )
            ],
          ),
        ),
      );
    } else {
      // Ipad Screen
      return Text("Ipad screen not done");
    }
  }
}
