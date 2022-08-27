// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class calculatorNPK extends StatefulWidget {
  const calculatorNPK({Key? key}) : super(key: key);

  @override
  _calculatorNPKState createState() => _calculatorNPKState();
}

class _calculatorNPKState extends State<calculatorNPK> {
  List<String> items = ['Urea', 'ZA', 'SP-36'];
  String? selectedItem = 'Urea';
  var dropdownVal = "Lbs";
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
                Center(
                  child: Column(
                    children: [
                      Image(
                        image: AssetImage(
                            'assets/image/simple-icons_convertio.png'),
                        fit: BoxFit.cover,
                        height: 50,
                      ),
                      SizedBox(height: 20),
                      Text(
                        'NPK and N-P205-K20 Converter',
                        style: GoogleFonts.inter(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff209556)),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  'Select Fertilizer Items',
                  style: GoogleFonts.inter(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff209556)),
                ),
                SizedBox(height: 10),
                SizedBox(
                    width: 400,
                    height: 55,
                    child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6),
                                borderSide: BorderSide(
                                    width: 1, color: Color(0xff06AA51)))),
                        value: selectedItem,
                        items: items
                            .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(item,
                                    style: GoogleFonts.inter(
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                        color: Color(0xff06AA51)))))
                            .toList(),
                        onChanged: (item) =>
                            setState(() => selectedItem = item))),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Center(
                      child: SizedBox(
                        width: 83,
                        height: 65,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                "N",
                                style: const TextStyle(
                                    fontSize: 18,
                                    color: Color(0xFF06AA50),
                                    fontWeight: FontWeight.w700),
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(10),
                                  isDense: true,
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        color: Color.fromARGB(255, 95, 95, 95)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        color: Color.fromARGB(255, 95, 95, 95)),
                                  ),
                                ),
                              )
                            ]),
                      ),
                    ),
                    Center(
                      child: SizedBox(
                        width: 83,
                        height: 65,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                "P",
                                style: const TextStyle(
                                    fontSize: 18,
                                    color: Color(0xFF06AA50),
                                    fontWeight: FontWeight.w700),
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(10),
                                  isDense: true,
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        color: Color.fromARGB(255, 95, 95, 95)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        color: Color.fromARGB(255, 95, 95, 95)),
                                  ),
                                ),
                              )
                            ]),
                      ),
                    ),
                    Center(
                      child: SizedBox(
                        width: 83,
                        height: 65,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                "K",
                                style: const TextStyle(
                                    fontSize: 18,
                                    color: Color(0xFF06AA50),
                                    fontWeight: FontWeight.w700),
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(10),
                                  isDense: true,
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        color: Color.fromARGB(255, 95, 95, 95)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        color: Color.fromARGB(255, 95, 95, 95)),
                                  ),
                                ),
                              )
                            ]),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  "Amount",
                  style: TextStyle(
                      color: Color(0xFF209556),
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 174,
                      child: TextFormField(
                        decoration: InputDecoration(
                          suffixIconConstraints:
                              BoxConstraints(minWidth: 0, minHeight: 0),
                          suffixIcon: Padding(
                            padding: EdgeInsets.all(5),
                            child: SizedBox(
                              width: 70,
                              child: DropdownButtonFormField<String>(
                                style: TextStyle(color: Color(0xFF888888)),
                                value: dropdownVal,
                                decoration: InputDecoration(
                                  isDense: true,
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10),
                                  filled: true,
                                  fillColor: Color(0xFFD0D0D0),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        width: 0.0, color: Colors.transparent),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        width: 0.0, color: Colors.transparent),
                                  ),
                                ),
                                dropdownColor: Color(0xFFD0D0D0),
                                items: [
                                  "Lbs"
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (String? newVal) {
                                  setState(() {
                                    dropdownVal = newVal!;
                                  });
                                },
                              ),
                            ),
                          ),
                          contentPadding: EdgeInsets.all(10),
                          isDense: true,
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 95, 95, 95)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 95, 95, 95)),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 75),
                    ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            primary: const Color(0xFF06AA51),
                            elevation: 0,
                            fixedSize: const Size(120, 34),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(9))),
                        child: const Text("Add",
                            style: const TextStyle(fontSize: 17)))
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  "List of Fertilizer Items",
                  style: TextStyle(
                      color: Color(0xFF209556),
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
                SizedBox(height: 10),
                Center(
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xff888888)),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        padding: EdgeInsets.all(10),
                        width: 370,
                        height: 133,
                        child: SingleChildScrollView()),
                  ),
                ),
                SizedBox(height: 10),
                Center(
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            primary: const Color(0xFF06AA50),
                            elevation: 0,
                            fixedSize: const Size(370, 45),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        child: const Text("Calculate",
                            style: const TextStyle(fontSize: 17)))),
                SizedBox(height: 10),
                Center(
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    elevation: 2,
                    color: const Color.fromARGB(255, 244, 244, 244),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      width: 370,
                      height: 199,
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text("Calculations :",
                            style: TextStyle(
                                color: const Color(0xFF06AA50),
                                fontSize: 15,
                                fontWeight: FontWeight.w700)),
                      ),
                    ),
                  ),
                ),
              ],
            )),
      ]),
    )));
  }
}
