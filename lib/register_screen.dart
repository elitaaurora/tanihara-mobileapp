// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:tanihara/bottom_navbar.dart';
import 'package:tanihara/phoneauth_screen.dart';
import 'package:tanihara/provider/internet_provider.dart';
import 'package:tanihara/provider/sign_in_provider.dart';
import 'package:provider/provider.dart     ';
import 'package:tanihara/utils/next_screen.dart';
import 'package:tanihara/utils/snack_bar.dart';
import '../model/user_model.dart';

// ignore: camel_case_types
class registerscreen extends StatefulWidget {
  const registerscreen({Key? key}) : super(key: key);
  @override
  _registerscreenState createState() => _registerscreenState();
}

class _registerscreenState extends State<registerscreen> {
  //form key
  final _formKey = GlobalKey<FormState>();

  //Editing Controller
  final nameController = new TextEditingController();
  final emailEditingController = new TextEditingController();
  final phoneNumberController = new TextEditingController();
  final passwordEditingController = new TextEditingController();

  //firebase
  final _auth = FirebaseAuth.instance;

  final GlobalKey _scaffoldKey = GlobalKey<ScaffoldState>();
  final RoundedLoadingButtonController phoneController =
      RoundedLoadingButtonController();
  final RoundedLoadingButtonController googleController =
      RoundedLoadingButtonController();
  final RoundedLoadingButtonController facebookController =
      RoundedLoadingButtonController();

  bool firstValue = false;
  @override
  Widget build(BuildContext context) {
    final nameField =
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("Name",
          style: GoogleFonts.inter(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Color(0xff06AA51))),
      TextFormField(
        autofocus: false,
        controller: nameController,
        keyboardType: TextInputType.name,
        validator: (value) {
          RegExp regex = RegExp(r'^.{4,}$');
          if (value!.isEmpty) {
            return ("Please enter your name");
          }
          if (!regex.hasMatch(value)) {
            return ("Please enter valid name");
          }
          return null;
        },
        onSaved: (value) {
          nameController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 5.0),
          fillColor: Color.fromARGB(245, 245, 245, 245),
          filled: true,
          hintText: "  Enter here...",
          hintStyle: GoogleFonts.inter(
              fontSize: 15,
              fontWeight: FontWeight.normal,
              color: Color(0xff888888)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(19),
            borderSide: BorderSide(width: 0.5, color: Color(0xff888888)),
          ),
        ),
      )
    ]);

    // email field
    final emailField =
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("Email",
          style: GoogleFonts.inter(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Color(0xff06AA51))),
      TextFormField(
        autofocus: false,
        controller: emailEditingController,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value!.isEmpty) {
            return ("please enter your email");
          }
          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-].[a-z]")
              .hasMatch(value)) {
            return ("Please enter a valid email");
          }
          return null;
        },
        onSaved: (value) {
          emailEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 5.0),
          fillColor: Color.fromARGB(245, 245, 245, 245),
          filled: true,
          hintText: "  Enter here...",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(19),
            borderSide: BorderSide(width: 0.5, color: Color(0xff888888)),
          ),
        ),
      )
    ]);

    final phoneNumberField =
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("Phone Number",
          style: GoogleFonts.inter(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Color(0xff06AA51))),
      TextFormField(
        autofocus: false,
        controller: phoneNumberController,
        keyboardType: TextInputType.phone,
        validator: (value) {
          RegExp regex = RegExp(r'^.{12,}$');
          if (value!.isEmpty) {
            return ("Please enter your phone number");
          }
          if (!regex.hasMatch(value)) {
            return ("Please enter valid phone number");
          }
          return null;
        },
        onSaved: (value) {
          phoneNumberController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 5.0),
          fillColor: Color.fromARGB(245, 245, 245, 245),
          filled: true,
          hintText: "  Enter here...",
          hintStyle: GoogleFonts.inter(
              fontSize: 15,
              fontWeight: FontWeight.normal,
              color: Color(0xff888888)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(19),
            borderSide: BorderSide(width: 0.5, color: Color(0xff888888)),
          ),
        ),
      )
    ]);

    final passwordField =
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("Password",
          style: GoogleFonts.inter(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Color(0xff06AA51))),
      TextFormField(
        autofocus: false,
        controller: passwordEditingController,
        obscureText: true,
        validator: (value) {
          RegExp regex = RegExp(r'^.{6,}$');
          if (value!.isEmpty) {
            return ("Please enter your password");
          }
          if (!regex.hasMatch(value)) {
            return ("Please enter valid password (Min. 6 Character");
          }
          return null;
        },
        onSaved: (value) {
          passwordEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 5.0),
          fillColor: Color.fromARGB(245, 245, 245, 245),
          filled: true,
          hintText: "  Enter here...",
          hintStyle: GoogleFonts.inter(
              fontSize: 15,
              fontWeight: FontWeight.normal,
              color: Color(0xff888888)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(19),
            borderSide: BorderSide(width: 0.5, color: Color(0xff888888)),
          ),
        ),
      )
    ]);

    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Center(
                      child: Text(
                        "Register",
                        style: GoogleFonts.inter(
                            fontSize: 30,
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 30, right: 30),
                      child: nameField,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 30, right: 30),
                      child: emailField,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 30, right: 30),
                      child: passwordField,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 30, right: 30),
                      child: phoneNumberField,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                margin: EdgeInsets.only(left: 30, right: 30),
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    signUp(emailEditingController.text,
                        passwordEditingController.text);
                  },
                  child: Text(
                    "Register",
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
              TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.black,
                  textStyle: const TextStyle(fontSize: 20),
                ),
                onPressed: () {},
                child: Text(
                  "Forgot Password?",
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    fontWeight: FontWeight.normal,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              Text("Or continue with",
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    fontWeight: FontWeight.normal,
                    color: Color.fromARGB(255, 71, 71, 71),
                  )),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 40),
                    height: 50,
                    width: 50,
                    child: OutlinedButton(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 12,
                          ),
                          Image.asset("assets/image/phone.png",
                              height: 25, fit: BoxFit.fill),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                      onPressed: () {
                        nextScreenReplace(context, const PhoneAuthScreen());
                        //           phoneController.reset();
                      },
                      style: OutlinedButton.styleFrom(
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                        ),
                        side: BorderSide(
                          width: 1.5,
                          color: Color(0xff06AA51),
                          style: BorderStyle.solid,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    child: OutlinedButton(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 12,
                          ),
                          Image.asset("assets/image/google.png",
                              height: 25, fit: BoxFit.fill),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                      onPressed: () {
                        handleGoogleSignIn();
                      },
                      style: OutlinedButton.styleFrom(
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                        ),
                        side: BorderSide(
                          width: 1.5,
                          color: Color(0xff06AA51),
                          style: BorderStyle.solid,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 40),
                    height: 50,
                    width: 50,
                    child: OutlinedButton(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 12,
                          ),
                          Image.asset("assets/image/facebook.png",
                              height: 25, fit: BoxFit.fill),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                      onPressed: () {
                        handleFacebookAuth();
                      },
                      style: OutlinedButton.styleFrom(
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                        ),
                        side: BorderSide(
                          width: 1.5,
                          color: Color(0xff06AA51),
                          style: BorderStyle.solid,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: GoogleFonts.inter(
                        fontSize: 13,
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.normal),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.black,
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text(
                      "Login now",
                      style: GoogleFonts.inter(
                        fontSize: 13,
                        color: Color(0xff06AA51),
                        fontWeight: FontWeight.normal,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        )),
      ),
    );
  }

  Future signUp(String email, String password) async {
    await _auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) => {postDetailsToFirestore()})
        .catchError((e) {
      Fluttertoast.showToast(msg: e!.message);
    });
  }

  void postDetailsToFirestore() async {
    //calling out firestore
    //calling our user nodel
    //sending these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    //writing ll the falues
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.name = nameController.text;
    userModel.phoneNumber = phoneNumberController.text;
    userModel.password = passwordEditingController.text;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account created successfully");

    Navigator.pushAndRemoveUntil((context),
        MaterialPageRoute(builder: (context) => HomePage()), (route) => false);
  }

  Future handleGoogleSignIn() async {
    final sp = context.read<SignInProvider>();
    final ip = context.read<InternetProvider>();
    await ip.checkInternetConnection();

    if (ip.hasInternet == false) {
      openSnackbar(context, "Check your Internet connection", Colors.red);
      googleController.reset();
    } else {
      await sp.signInWithGoogle().then((value) {
        if (sp.hasError == true) {
          openSnackbar(context, sp.errorCode.toString(), Colors.red);
          googleController.reset();
        } else {
          // checking whether user exists or not
          sp.checkUserExists().then((value) async {
            if (value == true) {
              // user exists
              await sp.getUserDataFromFirestore(sp.uid).then((value) => sp
                  .saveDataToSharedPreferences()
                  .then((value) => sp.setSignIn().then((value) {
                        googleController.success();
                        handleAfterSignIn();
                      })));
            } else {
              // user does not exist
              sp.saveDataToFirestore().then((value) => sp
                  .saveDataToSharedPreferences()
                  .then((value) => sp.setSignIn().then((value) {
                        googleController.success();
                        handleAfterSignIn();
                      })));
            }
          });
        }
      });
    }
  }

  Future handleFacebookAuth() async {
    final sp = context.read<SignInProvider>();
    final ip = context.read<InternetProvider>();
    await ip.checkInternetConnection();

    if (ip.hasInternet == false) {
      openSnackbar(context, "Check your Internet connection", Colors.red);
      facebookController.reset();
    } else {
      await sp.signInWithFacebook().then((value) {
        if (sp.hasError == true) {
          openSnackbar(context, sp.errorCode.toString(), Colors.red);
          facebookController.reset();
        } else {
          // checking whether user exists or not
          sp.checkUserExists().then((value) async {
            if (value == true) {
              // user exists
              await sp.getUserDataFromFirestore(sp.uid).then((value) => sp
                  .saveDataToSharedPreferences()
                  .then((value) => sp.setSignIn().then((value) {
                        facebookController.success();
                        handleAfterSignIn();
                      })));
            } else {
              // user does not exist
              sp.saveDataToFirestore().then((value) => sp
                  .saveDataToSharedPreferences()
                  .then((value) => sp.setSignIn().then((value) {
                        facebookController.success();
                        handleAfterSignIn();
                      })));
            }
          });
        }
      });
    }
  }

  //handle after signin
  handleAfterSignIn() {
    Future.delayed(const Duration(milliseconds: 1000)).then((value) {
      nextScreenReplace(context, const HomePage());
    });
  }
}
