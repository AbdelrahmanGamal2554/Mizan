import 'package:flutter/material.dart';
import 'package:mizan/models/payment_model.dart';
import 'package:mizan/models/project_vars.dart';
import '../home_screen.dart';
import '../../databases/sqflite.dart';

class AqsatScreen extends StatefulWidget {
  const AqsatScreen({super.key});

  @override
  State<AqsatScreen> createState() => _AqsatState();
}

class _AqsatState extends State<AqsatScreen> {
  TextEditingController paymentController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController noteController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    paymentController.dispose();
    dateController.dispose();
    noteController.dispose();
  }

  List<PaymentModel> payments = [];
  void getData() async {
    payments = await SqlHelper().getData();
    setState(() {});
  }

  void insertPayment(PaymentModel payment) async {
    SqlHelper().insertData(payment);
    getData();
  }

  void updatePayment(PaymentModel payment) async {
    SqlHelper().update(payment);
    getData();
  }

  void deletePayment(int id) async {
    SqlHelper().delete(id);
    getData();
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    // ScreenSize.intial(context);
    // double col1Width = ScreenSize.width * 2 / 9;
    // double col2Width = ScreenSize.width * 2 / 9;
    // double col3Width = ScreenSize.width * 4 / 9;
    // double col4Width = ScreenSize.width * 1 / 9;

    return Scaffold(
      backgroundColor: kPrimaryColor,
      floatingActionButton: Row(
        children: [
          SizedBox(width: 30),
          FloatingActionButton(
            backgroundColor: kPrimaryColor3,
            heroTag: "floating1",
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
          SizedBox(width: 10),
          FloatingActionButton(
            backgroundColor: kPrimaryColor3,
            heroTag: "floating2",
            onPressed: () {
              paymentController.clear();
              dateController.clear();
              noteController.clear();
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    backgroundColor: Color(0xFFBEC69F),
                    content: Column(
                      children: [
                        TextField(
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.right,
                          controller: paymentController,
                          decoration: InputDecoration(
                            label: Align(
                              alignment: Alignment.centerRight,
                              child: Text("القسط الشهرى"),
                            ),
                          ),
                        ),
                        TextField(
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.right,
                          controller: dateController,
                          decoration: InputDecoration(
                            label: Align(
                              alignment: Alignment.centerRight,
                              child: Text("الميعاد"),
                            ),
                          ),
                        ),
                        TextField(
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.right,
                          controller: noteController,
                          decoration: InputDecoration(
                            label: Align(
                              alignment: Alignment.centerRight,
                              child: Text("ملاحظات"),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: kPrimaryColor3,
                              ),
                              child: Text(
                                "إضافة",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onPressed: () {
                                insertPayment(
                                  PaymentModel(
                                    payment: paymentController.text,
                                    date: dateController.text,
                                    notes: noteController.text,
                                  ),
                                );
                                paymentController.clear();
                                dateController.clear();
                                noteController.clear();
                                Navigator.pop(context);
                              },
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: kPrimaryColor3,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                "إلغاء",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            child: Icon(Icons.add),
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
                              "فى هذه الغرفة يتم عرض أو إضافة أو حذف الأقساط الملتزم بها حاليا",
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
          SliverToBoxAdapter(child: SizedBox(height: 20)),
          SliverToBoxAdapter(
            child:
                payments.isEmpty
                    ? Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 400,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          // color: kPrimaryColor4,
                          image: DecorationImage(
                            image: AssetImage("assets/images/no_quest.gif"),
                            fit: BoxFit.cover,
                          ),
                        ),
                        // child: Image.asset(
                        //   "assets/images/no_quest.gif",
                        //   fit: BoxFit.cover,
                        // ),
                      ),
                    )
                    : SizedBox(
                      width: double.infinity,
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: DataTable(
                          border: TableBorder.all(color: Colors.grey),
                          columns: [
                            DataColumn(
                              label: Expanded(child: Text("القسط الشهرى")),
                              // columnWidth: IntrinsicColumnWidth(flex: 2),
                            ),
                            DataColumn(
                              label: Expanded(child: Text("الميعاد")),
                              // columnWidth: IntrinsicColumnWidth(flex: 2),
                            ),
                            DataColumn(
                              label: Expanded(child: Text("ملاحظات")),
                              // columnWidth: IntrinsicColumnWidth(flex: 4),
                            ),
                          ],
                          rows: <DataRow>[
                            for (PaymentModel paymentInist in payments)
                              DataRow(
                                onLongPress: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      paymentController.text =
                                          paymentInist.payment;
                                      dateController.text = paymentInist.date;
                                      noteController.text = paymentInist.notes;
                                      return AlertDialog(
                                        backgroundColor: Color(0xFFBEC69F),
                                        content: Column(
                                          children: [
                                            TextField(
                                              textDirection: TextDirection.rtl,
                                              textAlign: TextAlign.right,
                                              controller: paymentController,
                                              decoration: InputDecoration(
                                                label: Align(
                                                  alignment:
                                                      Alignment.centerRight,
                                                  child: Text("payment"),
                                                ),
                                              ),
                                            ),
                                            TextField(
                                              textDirection: TextDirection.rtl,
                                              textAlign: TextAlign.right,
                                              controller: dateController,
                                              decoration: InputDecoration(
                                                label: Align(
                                                  alignment:
                                                      Alignment.centerRight,
                                                  child: Text("date"),
                                                ),
                                              ),
                                            ),
                                            TextField(
                                              textDirection: TextDirection.rtl,
                                              textAlign: TextAlign.right,
                                              controller: noteController,
                                              decoration: InputDecoration(
                                                label: Align(
                                                  alignment:
                                                      Alignment.centerRight,
                                                  child: Text("note"),
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 20),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                        backgroundColor:
                                                            kPrimaryColor3,
                                                      ),
                                                  child: Text(
                                                    "حفظ",
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  onPressed: () {
                                                    updatePayment(
                                                      PaymentModel(
                                                        id: paymentInist.id,
                                                        payment:
                                                            paymentController
                                                                .text,
                                                        date:
                                                            dateController.text,
                                                        notes:
                                                            noteController.text,
                                                      ),
                                                    );
                                                    paymentController.clear();
                                                    dateController.clear();
                                                    noteController.clear();
                                                    Navigator.pop(context);
                                                  },
                                                ),
                                                ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                        backgroundColor:
                                                            kPrimaryColor3,
                                                      ),
                                                  child: Text(
                                                    "مسح",
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  onPressed: () {
                                                    deletePayment(
                                                      paymentInist.id!,
                                                    );
                                                    setState(() {});
                                                    Navigator.pop(context);
                                                  },
                                                ),
                                                ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                        backgroundColor:
                                                            kPrimaryColor3,
                                                      ),
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text(
                                                    "إلغاء",
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
                                cells: <DataCell>[
                                  DataCell(
                                    Text(
                                      paymentInist.payment,
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                  DataCell(Text(paymentInist.date)),
                                  DataCell(Text(paymentInist.notes)),
                                ],
                              ),
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
