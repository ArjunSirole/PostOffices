// ignore_for_file: file_names, depend_on_referenced_packages

import 'dart:ui';

import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:restsample/rest_client.dart';

import 'json.dart';

class PincodeScreen extends StatefulWidget {
  const PincodeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<PincodeScreen> createState() => _PincodeScreenState();
}

class _PincodeScreenState extends State<PincodeScreen> {
  final TextEditingController pinCode = TextEditingController();
  List<Pincode> pincodes = [];

  // double _sigmaX = 0.0; // from 0-10
  // double _sigmaY = 0.0; // from 0-10
  final double _opacity = 0.1; // from 0-1.0
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox.expand(
      child: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/Image1.jpg'), fit: BoxFit.cover),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
            child: Container(
              color: Colors.black.withOpacity(_opacity),
              child: Column(
                children: [
                  Container(
                      padding: const EdgeInsets.only(
                          top: 30, bottom: 15, right: 75, left: 75),
                      child: TextField(
                        controller: pinCode,
                        decoration: const InputDecoration(
                            labelText:
                                "Enter Pincode "), // hintStyle: TextStyle(color: Colors.white), hintText: "Enter pincode"),
                        style:
                            const TextStyle(color: Colors.orange, fontSize: 25),
                      )),
                  Container(
                      padding: const EdgeInsets.only(
                          top: 0, left: 50, right: 50, bottom: 5),
                      child: ElevatedButton(
                        onPressed: () {
                          isLoading = true;
                          //             final logger = Logger();
                          final dio = Dio();
                          dio.options.headers["Demo-Header"] = "demo header";
                          final client = RestClient(dio);
                          client
                              .getPincode(pinCode.text)
                              .then((it) => setState(() {
                                    pincodes = it;
                                    isLoading = false;
                                  }));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                        ),
                        child: const Text("Search"),
                      )),
                  if (isLoading)
                    const Center(
                      child: CircularProgressIndicator(),
                    ),
                  _buildDataTable()
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }

  Widget _buildDataTable() {
    if (pincodes.isNotEmpty && pincodes[0].postOffice.isNotEmpty) {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
              padding: const EdgeInsets.all(10),
              child: const Text(
                "Available Post Offices are:",
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange),
              )),
          DataTable(
              dividerThickness: 1,
              dataRowHeight: 80,
              showBottomBorder: true,
              headingTextStyle: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.orange),
              headingRowColor: MaterialStateProperty.resolveWith(
                  (states) => Colors.transparent),

              //          columnSpacing: 15,
              //          horizontalMargin: 15,
              columns: const [
                DataColumn(
                  label: Expanded(
                    child: Text(
                      "Name",
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Text(
                      "Description",
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Text(
                      "Branch Type",
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Text(
                      "Delivery Status",
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Text(
                      "Circle",
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Text(
                      "District",
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Text(
                      "Division",
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Text(
                      "Region",
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Text(
                      "Block",
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Text(
                      "State",
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Text(
                      "Country",
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Text(
                      "Pincode",
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
              ],
              rows: List.generate(
                  pincodes[0].postOffice.length,
                  (index) => DataRow(cells: [
                        DataCell(Text(pincodes[0].postOffice[index].name,
                            style: const TextStyle(color: Colors.orange))),
                        DataCell(Text(
                            pincodes[0].postOffice[index].description ?? "",
                            style: const TextStyle(color: Colors.orange))),
                        DataCell(Text(pincodes[0].postOffice[index].branchType,
                            style: const TextStyle(color: Colors.orange))),
                        DataCell(Text(
                            pincodes[0].postOffice[index].deliveryStatus,
                            style: const TextStyle(color: Colors.orange))),
                        DataCell(Text(pincodes[0].postOffice[index].circle,
                            style: const TextStyle(color: Colors.orange))),
                        DataCell(Text(pincodes[0].postOffice[index].district,
                            style: const TextStyle(color: Colors.orange))),
                        DataCell(Text(pincodes[0].postOffice[index].division,
                            style: const TextStyle(color: Colors.orange))),
                        DataCell(Text(pincodes[0].postOffice[index].region,
                            style: const TextStyle(color: Colors.orange))),
                        DataCell(Text(pincodes[0].postOffice[index].block,
                            style: const TextStyle(color: Colors.orange))),
                        DataCell(Text(pincodes[0].postOffice[index].state,
                            style: const TextStyle(color: Colors.orange))),
                        DataCell(Text(pincodes[0].postOffice[index].country,
                            style: const TextStyle(color: Colors.orange))),
                        DataCell(Text(pincodes[0].postOffice[index].pincode,
                            style: const TextStyle(color: Colors.orange))),
                      ])))
        ]),
      );
    } else {
      return Container();
    }

//    return SingleChildScrollView(
//      scrollDirection: Axis.horizontal,
//      child: SingleChildScrollView(
//        scrollDirection: Axis.vertical,
//      ),
//    );
  }
}
