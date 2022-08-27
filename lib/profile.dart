// ignore_for_file: deprecated_member_use, unnecessary_new

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tanihara/model/user_model.dart';
import 'package:tanihara/language_setting.dart';
import 'package:tanihara/login_screen.dart';
import 'package:tanihara/notification_setting.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

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
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(height: 50),
              Container(
                  width: 600,
                  height: 193,
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
                  child: Center(
                      child: Column(children: [
                    SizedBox(
                      height: 10,
                    ),
                    // Image(
                    //   //gambar avatar
                    //   image: AssetImage('assets/image/user.png'),
                    //   fit: BoxFit.cover,
                    //   height: 84,
                    // ),
                    CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage:
                            NetworkImage('${loggedInUser.image_url}'),
                        radius: 50),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      //nama user
                      '${loggedInUser.name}',
                      style: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff209556)),
                    ),
                    Text(
                      '${loggedInUser.email}',
                      style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Color(0xff545454)),
                    )
                  ]))),
              SizedBox(
                height: 30,
              ),
              Container(
                  width: 600,
                  height: 56,
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Icon(Icons.language, color: Color(0xFF209556)),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Language',
                        style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff545454)),
                      ),
                      SizedBox(
                        width: 120,
                      ),
                      Text('English',
                          style: GoogleFonts.inter(
                              fontSize: 13,
                              fontWeight: FontWeight.normal,
                              color: Colors.black.withOpacity(0.5))),
                      SizedBox(
                        width: 15,
                      ),
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
                                  builder: (context) => (LanguageSetting()));
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
              SizedBox(
                height: 30,
              ),
              Container(
                  width: 600,
                  height: 56,
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Icon(Icons.notifications_none_outlined,
                          color: Color(0xFF209556)),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Notification',
                        style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff545454)),
                      ),
                      SizedBox(
                        width: 120,
                      ),
                      Text('On',
                          style: GoogleFonts.inter(
                              fontSize: 13,
                              fontWeight: FontWeight.normal,
                              color: Colors.black.withOpacity(0.5))),
                      SizedBox(
                        width: 27,
                      ),
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
                                      (NotificationSetting()));
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
              SizedBox(height: 100),
              Center(
                child: Container(
                  height: 50,
                  width: 2000,
                  child: ElevatedButton(
                    onPressed: () {
                      logout(context);
                    },
                    child: Text(
                      "Logout",
                      style: GoogleFonts.inter(
                          fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        primary: Color(0xff06AA51),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13),
                        )),
                  ),
                ),
              )
            ])));
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => loginscreen()));
  }
}
