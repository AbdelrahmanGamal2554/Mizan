import 'package:flutter/material.dart';
import 'package:mizan/models/project_vars.dart';
import 'package:mizan/databases/shared_pref.dart';
import '../home_screen.dart';
// import 'dart:developer';

class MasroufatScreen extends StatefulWidget {
  const MasroufatScreen({super.key});

  @override
  State<MasroufatScreen> createState() => _MasroufatState();
}

class _MasroufatState extends State<MasroufatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      floatingActionButton: Row(
        children: [
          SizedBox(width: 28),
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
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: 150,
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Positioned(
                    top: 10,
                    right: 10,
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage("assets/images/logo_2.png"),
                    ),
                  ),
                  Positioned(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        right: 80,
                        top: 50,
                        left: 10,
                        // bottom: 10,
                      ),
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: kPrimaryColor2,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: Text(
                              "فى هذه الصفحة يتم عرض افضل نسبة لتنظيم مصروفاتك من خلال مرتبك",
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: "Lemonada",
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 30)),
          SliverToBoxAdapter(
            child: Center(
              child: Container(
                height: 50,
                width: ScreenSize.width - 200,
                decoration: BoxDecoration(
                  color: kPrimaryColor4,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    SharedPref.getData(income),
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 40)),
          SliverToBoxAdapter(
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SizedBox(width: 20),
                    Container(
                      height: 350,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border(
                          top: BorderSide(width: 2, color: kPrimaryColor2),
                          bottom: BorderSide(width: 2, color: kPrimaryColor2),
                          right: BorderSide(width: 2, color: kPrimaryColor2),
                          left: BorderSide(width: 2, color: kPrimaryColor2),
                        ),
                      ),
                      child: Column(
                        children: [
                          Text(
                            "مصروفاتك الأساسية الثابتة",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(height: 20),
                          SizedBox(
                            width: 120,
                            height: 120,
                            child: Stack(
                              alignment: AlignmentDirectional.center,
                              children: [
                                Positioned(
                                  top: 0,
                                  bottom: 0,
                                  right: 0,
                                  left: 0,
                                  child: CircularProgressIndicator(
                                    value: .5,
                                    color: kPrimaryColor3,
                                    backgroundColor: kPrimaryColor2,
                                    strokeWidth: 7,
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "50.0%",
                                      style: TextStyle(
                                        fontFamily: "Handjet",
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25,
                                      ),
                                    ),
                                    Text(
                                      "${double.parse(SharedPref.getData(income)) / 2}",
                                      style: TextStyle(
                                        fontFamily: "Handjet",
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25,
                                        color: kPrimaryColor3,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          Directionality(
                            textDirection: TextDirection.rtl,
                            child: Row(
                              children: [
                                SizedBox(width: 10),
                                CircleAvatar(
                                  radius: 10,
                                  backgroundImage: AssetImage(
                                    "assets/images/l6.png",
                                  ),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "فواتير الكهرباء والمياه",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 5),
                          Directionality(
                            textDirection: TextDirection.rtl,
                            child: Row(
                              children: [
                                SizedBox(width: 10),
                                CircleAvatar(
                                  radius: 10,
                                  backgroundImage: AssetImage(
                                    "assets/images/l2.png",
                                  ),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "مصاريف التعليم",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 5),
                          Directionality(
                            textDirection: TextDirection.rtl,
                            child: Row(
                              children: [
                                SizedBox(width: 10),
                                CircleAvatar(
                                  radius: 10,
                                  backgroundImage: AssetImage(
                                    "assets/images/l3.png",
                                  ),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "الرعاية الصحية",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 5),
                          Directionality(
                            textDirection: TextDirection.rtl,
                            child: Row(
                              children: [
                                SizedBox(width: 10),
                                CircleAvatar(
                                  radius: 10,
                                  backgroundImage: AssetImage(
                                    "assets/images/l4.png",
                                  ),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "النقل",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 5),
                          Directionality(
                            textDirection: TextDirection.rtl,
                            child: Row(
                              children: [
                                SizedBox(width: 10),
                                CircleAvatar(
                                  radius: 10,
                                  backgroundImage: AssetImage(
                                    "assets/images/l44.png",
                                  ),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "الاتصالات",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 20),
                    Container(
                      height: 350,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border(
                          top: BorderSide(width: 2, color: kPrimaryColor2),
                          bottom: BorderSide(width: 2, color: kPrimaryColor2),
                          right: BorderSide(width: 2, color: kPrimaryColor2),
                          left: BorderSide(width: 2, color: kPrimaryColor2),
                        ),
                      ),
                      child: Column(
                        children: [
                          Text(
                            "مصروفاتك الشخصية المتغيرة",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(height: 20),
                          SizedBox(
                            width: 120,
                            height: 120,
                            child: Stack(
                              alignment: AlignmentDirectional.center,
                              children: [
                                Positioned(
                                  top: 0,
                                  bottom: 0,
                                  right: 0,
                                  left: 0,
                                  child: CircularProgressIndicator(
                                    value: .3,
                                    color: kPrimaryColor3,
                                    backgroundColor: kPrimaryColor2,
                                    strokeWidth: 7,
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "30.0%",
                                      style: TextStyle(
                                        fontFamily: "Handjet",
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25,
                                      ),
                                    ),
                                    Text(
                                      "${double.parse(SharedPref.getData(income)) * 30 / 100}",
                                      style: TextStyle(
                                        fontFamily: "Handjet",
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25,
                                        color: kPrimaryColor3,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          Directionality(
                            textDirection: TextDirection.rtl,
                            child: Row(
                              children: [
                                SizedBox(width: 10),
                                CircleAvatar(
                                  radius: 10,
                                  backgroundImage: AssetImage(
                                    "assets/images/l4.png",
                                  ),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "التسوق",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 5),
                          Directionality(
                            textDirection: TextDirection.rtl,
                            child: Row(
                              children: [
                                SizedBox(width: 10),
                                CircleAvatar(
                                  radius: 10,
                                  backgroundImage: AssetImage(
                                    "assets/images/l5.png",
                                  ),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "الانشطة الترفيهية",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 5),
                          Directionality(
                            textDirection: TextDirection.rtl,
                            child: Row(
                              children: [
                                SizedBox(width: 10),
                                CircleAvatar(
                                  radius: 10,
                                  backgroundImage: AssetImage(
                                    "assets/images/l7.png",
                                  ),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "الرحلات",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 5),
                          Directionality(
                            textDirection: TextDirection.rtl,
                            child: Row(
                              children: [
                                SizedBox(width: 10),
                                CircleAvatar(
                                  radius: 10,
                                  backgroundImage: AssetImage(
                                    "assets/images/l8.png",
                                  ),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "الهدايا",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 20),
                    Container(
                      height: 350,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border(
                          top: BorderSide(width: 2, color: kPrimaryColor2),
                          bottom: BorderSide(width: 2, color: kPrimaryColor2),
                          right: BorderSide(width: 2, color: kPrimaryColor2),
                          left: BorderSide(width: 2, color: kPrimaryColor2),
                        ),
                      ),
                      child: Column(
                        children: [
                          Text(
                            "الادخارات و الاستثمارات",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(height: 20),
                          SizedBox(
                            width: 120,
                            height: 120,
                            child: Stack(
                              alignment: AlignmentDirectional.center,
                              children: [
                                Positioned(
                                  top: 0,
                                  bottom: 0,
                                  right: 0,
                                  left: 0,
                                  child: CircularProgressIndicator(
                                    value: .2,
                                    color: kPrimaryColor3,
                                    backgroundColor: kPrimaryColor2,
                                    strokeWidth: 7,
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "20.0%",
                                      style: TextStyle(
                                        fontFamily: "Handjet",
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25,
                                      ),
                                    ),
                                    Text(
                                      "${double.parse(SharedPref.getData(income)) / 5}",
                                      style: TextStyle(
                                        fontFamily: "Handjet",
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25,
                                        color: kPrimaryColor3,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          Directionality(
                            textDirection: TextDirection.rtl,
                            child: Row(
                              children: [
                                SizedBox(width: 10),
                                CircleAvatar(
                                  radius: 10,
                                  backgroundImage: AssetImage(
                                    "assets/images/l9.png",
                                  ),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "زيادة المدخرات",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 5),
                          Directionality(
                            textDirection: TextDirection.rtl,
                            child: Row(
                              children: [
                                SizedBox(width: 10),
                                CircleAvatar(
                                  radius: 10,
                                  backgroundImage: AssetImage(
                                    "assets/images/l10.png",
                                  ),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "تعديل سداد الديون",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 5),
                          Directionality(
                            textDirection: TextDirection.rtl,
                            child: Row(
                              children: [
                                SizedBox(width: 10),
                                CircleAvatar(
                                  radius: 10,
                                  backgroundImage: AssetImage(
                                    "assets/images/l10.png",
                                  ),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "حالات الطوارئ",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
