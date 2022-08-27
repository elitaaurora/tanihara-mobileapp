import 'package:flutter/material.dart';

class ConvertFertilizerScreen extends StatefulWidget {
  const ConvertFertilizerScreen({Key? key}) : super(key: key);

  @override
  State<ConvertFertilizerScreen> createState() =>
      _ConvertFertilizerScreenState();
}

class _ConvertFertilizerScreenState extends State<ConvertFertilizerScreen> {
  var dropdownVal = "grams/liter";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              IconButton(
                tooltip: "Back to home screen",
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back),
              ),
              Center(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Image(
                    image: AssetImage('assets/image/Vector.png'),
                    fit: BoxFit.cover,
                    height: 50,
                  ),
                  SizedBox(height: 13),
                  Text("Fertilizer PPM Calculator",
                      style: TextStyle(
                          fontSize: 17,
                          color: Color(0xFF06AA50),
                          fontWeight: FontWeight.w700)),
                ],
              )),
              SizedBox(
                height: 40,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
              ),
              SizedBox(height: 20),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Amount",
                      style: TextStyle(
                          color: Color(0xFF06AA50),
                          fontWeight: FontWeight.w700,
                          fontSize: 21),
                    ),
                    Text("Mixed with water",
                        style: TextStyle(color: Color(0xFF888888))),
                    SizedBox(height: 5),
                    Stack(children: [
                      SizedBox(
                        width: 317,
                        child: TextFormField(
                          decoration: InputDecoration(
                            suffixIconConstraints:
                                BoxConstraints(minWidth: 0, minHeight: 0),
                            suffixIcon: Padding(
                              padding: EdgeInsets.all(5),
                              child: SizedBox(
                                width: 140,
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
                                          width: 0.0,
                                          color: Colors.transparent),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                          width: 0.0,
                                          color: Colors.transparent),
                                    ),
                                  ),
                                  dropdownColor: Color(0xFFD0D0D0),
                                  items: ["grams/liter"]
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
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
                    ]),
                  ],
                ),
              ),
              SizedBox(height: 29),
              Center(
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          primary: const Color(0xFF06AA50),
                          elevation: 0,
                          fixedSize: const Size(320, 50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      child: const Text("Calculate",
                          style: const TextStyle(fontSize: 17)))),
              SizedBox(height: 15),
              Center(
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  elevation: 2,
                  color: const Color.fromARGB(255, 244, 244, 244),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    width: 324,
                    height: 199,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text("Calculations :",
                          style: TextStyle(
                              color: const Color(0xFF06AA50),
                              fontSize: 18,
                              fontWeight: FontWeight.w700)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
