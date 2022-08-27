// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LanguageSetting extends StatefulWidget {
  const LanguageSetting({Key? key}) : super(key: key);

  @override
  _LanguageSettingState createState() => _LanguageSettingState();
}

class _LanguageSettingState extends State<LanguageSetting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                'Language Setting',
                style: GoogleFonts.inter(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff209556)),
              ),
              SizedBox(height: 5),
              Text(
                'Please select your language',
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
                      color: Color(0xFFF5F5F5),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Icon(Icons.mode_standby, color: Color(0xFF209556)),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'English',
                          style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: Color(0xff545454)),
                        ),
                      ])),
              SizedBox(
                height: 20,
              ),
              Container(
                  width: 600,
                  height: 56,
                  decoration: BoxDecoration(
                      color: Color(0xFFF5F5F5), //warna background box
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Icon(Icons.adjust, color: Color(0xFF209556)),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Bahasa Indonesia',
                          style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: Color(0xff545454)),
                        ),
                      ])),
            ],
          )),
    ])));
  }
}
