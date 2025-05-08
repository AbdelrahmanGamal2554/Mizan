import 'package:flutter/material.dart';
import 'package:mizan/databases/shared_pref.dart';
import 'package:mizan/models/project_vars.dart';
import 'package:mizan/screens/signup.dart';
import '../home_screen.dart';

class BayanatScreen extends StatefulWidget {
  const BayanatScreen({super.key});

  @override
  State<BayanatScreen> createState() => _BayanatState();
}

class _BayanatState extends State<BayanatScreen> {
  @override
  Widget build(BuildContext context) {
    ScreenSize.intial(context);
    double screenWidth = ScreenSize.width;
    double screenHeight = ScreenSize.height;
    // log(screenWidth.toString());

    return Scaffold(
      backgroundColor: kPrimaryColor,
      floatingActionButton: Row(
        children: [
          SizedBox(width: 30),
          FloatingActionButton(
            backgroundColor: kPrimaryColor3,
            child: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return HomeScreen();
                  },
                ),
              );
            },
          ),
        ],
      ),
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 100),
            child: Container(
              height: screenHeight,
              width: screenWidth,
              decoration: BoxDecoration(
                color: kPrimaryColor2,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(height: 10),
                  Text(
                    SharedPref.getData(username),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  Text(
                    SharedPref.getData(email),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Container(
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: kPrimaryColor3,
                    ),
                    child: Center(
                      child: Text(
                        SharedPref.getData(country),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        height: 150,
                        width: 150,
                        child: Stack(
                          alignment: AlignmentDirectional.center,
                          clipBehavior: Clip.none,
                          children: [
                            Text(
                              SharedPref.getData(income),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: "Handjet",
                                fontSize: 30,
                              ),
                            ),
                            Positioned(
                              top: 25,
                              bottom: 25,
                              right: 25,
                              left: 25,
                              child: SizedBox(
                                child: CircularProgressIndicator(
                                  value: .5,
                                  backgroundColor: Colors.grey,
                                  color: Colors.white,
                                  strokeWidth: 8,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              child: Text(
                                "الراتب الشهرى",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 150,
                        width: 150,
                        child: Stack(
                          alignment: AlignmentDirectional.center,
                          clipBehavior: Clip.none,
                          children: [
                            Text(
                              SharedPref.getData(balance),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: "Handjet",
                                fontSize: 30,
                              ),
                            ),
                            Positioned(
                              top: 25,
                              bottom: 25,
                              right: 25,
                              left: 25,
                              child: SizedBox(
                                child: CircularProgressIndicator(
                                  value: .5,
                                  backgroundColor: Colors.grey,
                                  color: Colors.white,
                                  strokeWidth: 8,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              child: Text(
                                "الحساب البنكى",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return Signup();
                            },
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kPrimaryColor,
                    ),
                    child: Text(
                      "تعديل",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black,
                        fontFamily: "ReadexPro",
                      ),
                    ),
                  ),

                  // SizedBox(height: 0),
                ],
              ),
            ),
          ),
          Positioned(
            top: 30,
            child: CircleAvatar(
              radius: 70,
              backgroundColor: kPrimaryColor2,
              child: CircleAvatar(
                radius: 63,
                foregroundImage: AssetImage("assets/images/slogan.gif"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
