import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddRequestsScreen extends StatefulWidget {
  const AddRequestsScreen({Key? key}) : super(key: key);

  @override
  State<AddRequestsScreen> createState() => _AddRequestsScreenState();
}

class _AddRequestsScreenState extends State<AddRequestsScreen> {
  String name = "";
  String age = "";
  String sex = "";
  String uhid = "";
  File? referralSlip;
  String reasonOfReferral = "";
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        toolbarHeight: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Icon(
                        Icons.arrow_back_outlined,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 0),
                        child: Text(
                          "New Transfer Request",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 26,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 0),
                        child: Text(
                          "Please enter all required details",
                          style:
                              TextStyle(fontSize: 12, color: Colors.grey[600]),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title.toString()),
                        SizedBox(height: 5),
                        Container(
                          width: double.maxFinite,
                          height: 50 + (maxlines > 1 ? (12.5 * maxlines) : 0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey, blurRadius: 1, offset: Offset(0, 1))
                              ]),
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: TextFormField(
                            initialValue: initVal,
                            maxLines: maxlines.floor(),
                            decoration: InputDecoration(border: InputBorder.none),
                            onChanged: (str) {
                              initVal = str;
                              onChanged(str);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title.toString()),
                        SizedBox(height: 5),
                        Container(
                          width: double.maxFinite,
                          height: 50 + (maxlines > 1 ? (12.5 * maxlines) : 0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey, blurRadius: 1, offset: Offset(0, 1))
                              ]),
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: TextFormField(
                            initialValue: initVal,
                            maxLines: maxlines.floor(),
                            decoration: InputDecoration(border: InputBorder.none),
                            onChanged: (str) {
                              initVal = str;
                              onChanged(str);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title.toString()),
                        SizedBox(height: 5),
                        Container(
                          width: double.maxFinite,
                          height: 50 + (maxlines > 1 ? (12.5 * maxlines) : 0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey, blurRadius: 1, offset: Offset(0, 1))
                              ]),
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: TextFormField(
                            initialValue: initVal,
                            maxLines: maxlines.floor(),
                            decoration: InputDecoration(border: InputBorder.none),
                            onChanged: (str) {
                              initVal = str;
                              onChanged(str);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title.toString()),
                        SizedBox(height: 5),
                        Container(
                          width: double.maxFinite,
                          height: 50 + (maxlines > 1 ? (12.5 * maxlines) : 0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey, blurRadius: 1, offset: Offset(0, 1))
                              ]),
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: TextFormField(
                            initialValue: initVal,
                            maxLines: maxlines.floor(),
                            decoration: InputDecoration(border: InputBorder.none),
                            onChanged: (str) {
                              initVal = str;
                              onChanged(str);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Attach Referral Slip"),
                        SizedBox(height: 5),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.width * 9 / 16,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 1,
                                    offset: Offset(0, 1))
                              ]),
                          child: Center(
                            child: Icon(
                              Icons.add_photo_alternate_outlined,
                              size: 40,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title.toString()),
                        SizedBox(height: 5),
                        Container(
                          width: double.maxFinite,
                          height: 50 + (maxlines > 1 ? (12.5 * maxlines) : 0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey, blurRadius: 1, offset: Offset(0, 1))
                              ]),
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: TextFormField(
                            initialValue: initVal,
                            maxLines: maxlines.floor(),
                            decoration: InputDecoration(border: InputBorder.none),
                            onChanged: (str) {
                              initVal = str;
                              onChanged(str);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  loading
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : InkWell(
                          onTap: () async {
                            if (name.isEmpty ||
                                age.isEmpty ||
                                sex.isEmpty ||
                                uhid.isEmpty ||
                                referralSlip == null) {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  content: Text(
                                      "All required details must be filled")));
                            } else {
                              setState(() {
                                loading = true;
                              });
                              try {
                                String banner_uri =
                                    await uploadImageToFirebase();
                                await FirebaseFirestore.instance
                                    .collection("Requests")
                                    .doc()
                                    .set({
                                  "name": name,
                                  "age": age,
                                  "sex": sex,
                                  "uhid_to": uhid,
                                  "uhid_by": "jhansi",
                                  "referal_slip": banner_uri,
                                  "reason": reasonOfReferral,
                                  "recieved": false
                                }).onError((error, stackTrace) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text("Some Error Occured")));
                                });
                                setState(() {
                                  loading = false;
                                });
                              } catch (e) {
                                setState(() {
                                  loading = false;
                                });
                              }
                            }
                          },
                          child: Container(
                            width: double.maxFinite,
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 1,
                                      offset: Offset(0, 1))
                                ],
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: Text(
                                "Add Request",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18),
                              ),
                            ),
                          ),
                        ),
                ],
              ),
            ),
            SizedBox(height: 60),
          ],
        ),
      ),
    );
  }

  // Widget customInputField({
  //   required String type,
  //   required String title,
  //   onChanged,
  //   double maxlines = 1,
  //   String? initVal,
  //   List<String>? items,
  // }) {
  //   return Padding(
  //     padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Text(title.toString()),
  //         SizedBox(height: 5),
  //         Container(
  //           width: double.maxFinite,
  //           height: 50 + (maxlines > 1 ? (12.5 * maxlines) : 0),
  //           decoration: BoxDecoration(
  //               color: Colors.white,
  //               borderRadius: BorderRadius.circular(10),
  //               boxShadow: [
  //                 BoxShadow(
  //                     color: Colors.grey, blurRadius: 1, offset: Offset(0, 1))
  //               ]),
  //           padding: EdgeInsets.symmetric(horizontal: 15),
  //           child: TextFormField(
  //             initialValue: initVal,
  //             maxLines: maxlines.floor(),
  //             decoration: InputDecoration(border: InputBorder.none),
  //             onChanged: (str) {
  //               initVal = str;
  //               onChanged(str);
  //             },
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Future uploadImageToFirebase() async {
    Reference firebaseStorageRef =
        FirebaseStorage.instance.ref().child('banners/${getRandomString(10)}');
    UploadTask uploadTask = firebaseStorageRef.putFile(referralSlip!);
    TaskSnapshot taskSnapshot = await uploadTask;
    String url = await taskSnapshot.ref.getDownloadURL();
    return url;
  }
}

const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
Random _rnd = Random();

String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
    length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
