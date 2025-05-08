// import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:mizan/models/project_vars.dart';
import 'package:mizan/databases/shared_pref.dart';
import 'package:mizan/screens/home_screen.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController usernameController = TextEditingController();

  TextEditingController emailController = TextEditingController();
  TextEditingController incomController = TextEditingController();
  TextEditingController balanceController = TextEditingController();
  GlobalKey<FormState> validationKey = GlobalKey();

  bool obsecureIncome = true;
  bool obsecurebalance = true;
  String? _selectedValue;

  @override
  void dispose() {
    super.dispose();
    usernameController.dispose();
    emailController.dispose();
    incomController.dispose();
    balanceController.dispose();
  }

  // void dropdownCallBack(String? selectedValue) {
  //   if (selectedValue is String) {
  //     _selectedValue = selectedValue;
  //     setState(() {});
  //   }
  // }

  bool evaluateInput() {
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Center(
              child: Text(
                "ميزان",
                style: TextStyle(
                  fontFamily: "Lemonada",
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: ScreenSize.width > 300 ? 300 : ScreenSize.width,
              child: Image.asset("assets/images/login.gif"),
            ),
          ),
          SliverToBoxAdapter(
            child: Form(
              key: validationKey,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          label: Text(
                            "الاسم الكامل",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        controller: usernameController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Must not be Empty";
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          label: Text(
                            "البريد الالكترونى",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        controller: emailController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Must not be Empty";
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        obscureText: obsecureIncome,
                        obscuringCharacter: '\$',
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          label: Text(
                            "الدخل الشهرى",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          suffix: IconButton(
                            icon: Icon(
                              obsecureIncome
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed: () {
                              obsecureIncome = !obsecureIncome;
                              setState(() {});
                            },
                          ),
                        ),
                        controller: incomController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Must not be Empty";
                          } else if (double.tryParse(value) == null) {
                            return "Must be Numbers";
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        obscureText: obsecurebalance,
                        obscuringCharacter: '\$',
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          label: Text(
                            "الرصيد فى البنك",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          suffix: IconButton(
                            icon: Icon(
                              obsecurebalance
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed: () {
                              obsecurebalance = !obsecurebalance;
                              setState(() {});
                            },
                          ),
                        ),
                        controller: balanceController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Must not be Empty";
                          } else if (double.tryParse(value) == null) {
                            return "Must be Numbers";
                          } else {
                            return null;
                          }
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "اختر دولتك",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                          Flexible(
                            child: ConstrainedBox(
                              constraints: BoxConstraints(maxWidth: 200),
                              child: DropdownButtonFormField(
                                alignment: AlignmentDirectional.center,
                                icon: Icon(Icons.arrow_downward),
                                items: [
                                  for (String country in items1)
                                    DropdownMenuItem(
                                      value: country,
                                      child: Text(country),
                                    ),
                                ],
                                // [
                                //   DropdownMenuItem(value: 'Item1', child: Text("Item1")),
                                //   DropdownMenuItem(value: 'Item2', child: Text("Item2")),
                                // ],
                                value: _selectedValue,
                                hint: Text("Choose a country"),
                                onChanged: ((selected) {
                                  setState(() {
                                    _selectedValue = selected;
                                  });
                                }),
                                validator: (choise) {
                                  if (choise == null || choise.isEmpty) {
                                    return "Must Choose a country";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryColor3,
                ),

                onPressed: () {
                  if (validationKey.currentState!.validate()) {
                    SharedPref.storeData(username, usernameController.text);
                    SharedPref.storeData(email, emailController.text);
                    SharedPref.storeData(income, incomController.text);
                    SharedPref.storeData(balance, balanceController.text);
                    SharedPref.storeData(country, _selectedValue);
                    setState(() {});
                    // log(incomController.text);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return HomeScreen();
                        },
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text('Form is Invalid')));
                  }
                },
                child: Text(
                  "تسجيل الدخول",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    fontFamily: "Handjet",
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 50)),
        ],
      ),
    );
  }
}
