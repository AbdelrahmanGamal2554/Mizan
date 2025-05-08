import 'package:flutter/material.dart';
import '../home_screen.dart';
import 'package:mizan/models/project_vars.dart';

class ConverterScreen extends StatefulWidget {
  const ConverterScreen({super.key});

  @override
  State<ConverterScreen> createState() => _ConverterScreenState();
}

class _ConverterScreenState extends State<ConverterScreen> {
  TextEditingController ammountController = TextEditingController();
  GlobalKey<FormState> validationKey = GlobalKey();
  String chosenCur = 'Egypt (EGP)';
  String? ammountInUSD;

  @override
  void dispose() {
    super.dispose();
    ammountController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFEF2E2),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.start,
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
                              "فى هذه الغرفة يمكنك تحويل العملات الى قيمتها الدولارية",
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: DropdownButton(
                    icon: Icon(Icons.arrow_downward),
                    value: chosenCur,
                    style: TextStyle(
                      fontFamily: "Handjet",
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    items: [
                      for (String curency in curencyItems)
                        DropdownMenuItem(value: curency, child: Text(curency)),
                    ],

                    onChanged: (String? val) {
                      setState(() {
                        chosenCur = val!;
                      });
                    },
                  ),
                ),
                Text(
                  "اختر العملة المراد تحويلها",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Form(
              key: validationKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value == "") {
                      return "Must not be Empty";
                    }
                    if (double.tryParse(value) == null) {
                      return "Must Be Numbers";
                    } else {
                      return null;
                    }
                  },
                  textAlign: TextAlign.center,
                  // textDirection: TextDirection.rtl,
                  controller: ammountController,
                  decoration: InputDecoration(
                    label: Align(
                      alignment: Alignment.centerRight,
                      child: Text("ادخل المبلغ"),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 30)),
          SliverToBoxAdapter(
            child: Center(
              child: SizedBox(
                width: 150,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kPrimaryColor3,
                  ),
                  onPressed: () {
                    if (validationKey.currentState!.validate()) {
                      ammountInUSD = (double.parse(ammountController.text) /
                              moneyFelow[chosenCur]!)
                          .toStringAsFixed(3);
                      setState(() {});
                    }
                  },
                  child: Text(
                    "تحويل",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Center(
              child: Container(
                height: 200,
                width: ScreenSize.width - 100,
                decoration: BoxDecoration(color: Colors.transparent),
                child: Center(
                  child: Text(
                    "$chosenCur (${ammountController.text}) = $ammountInUSD USD",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
