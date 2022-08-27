// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class notification extends StatefulWidget {
  const notification({Key? key}) : super(key: key);

  @override
  _notificationState createState() => _notificationState();
}

class _notificationState extends State<notification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                    'Notifications',
                    style: GoogleFonts.inter(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff209556)),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'You have on 1 new notification',
                    style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        color: Color(0xff545454)),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: 600,
                    height: 56,
                    decoration: BoxDecoration(
                        color: Color(0xFFF06AA51).withOpacity(0.19),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                        child: Text(
                      'Hi Patrick, dont forget to check your plant today!',
                      style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Colors.black),
                    )),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 600,
                    height: 56,
                    decoration: BoxDecoration(
                        color: Color(0xFFF5F5F5),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                        child: Text(
                      'Hi Patrick, Thanks for using TaniHara. Please tell us..',
                      style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Colors.black),
                    )),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 600,
                    height: 56,
                    decoration: BoxDecoration(
                        color: Color(0xFFF5F5F5),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                        child: Text(
                      'Welcome to TaniHara Patrick William, now you can..',
                      style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Colors.black),
                    )),
                  ),
                ],
              )),
        ]))));
  }
}
