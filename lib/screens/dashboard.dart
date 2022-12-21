import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mcrs/screens/new_request_screen.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int index = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        title: Text(
          "MCRS Dashboard",
          style: TextStyle(color: Colors.black),
        ),
        bottom: PreferredSize(
          preferredSize: const Size(double.infinity, 40),
          child: Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      index = 0;
                    });
                  },
                  child: Container(
                    height: 40,
                    color: index == 0 ? Colors.blue : Colors.white,
                    child: Center(
                      child: Text(
                        "Received",
                        style: TextStyle(
                            color: index == 0 ? Colors.white : Colors.black),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      index = 1;
                    });
                  },
                  child: Container(
                    color: index == 1 ? Colors.blue : Colors.white,
                    height: 40,
                    child: Center(
                      child: Text(
                        "Sent",
                        style: TextStyle(
                            color: index == 1 ? Colors.white : Colors.black),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ), // TabBar
      ),
      body: StreamBuilder<QuerySnapshot<Map>>(
        stream: FirebaseFirestore.instance.collection("Requests").snapshots(),
        builder: (context, snapshot) {
          try {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.blue,
                ),
              );
            } else {
              if (snapshot.data!.docs.length == 0) {
                return Center(child: Text("No Requests Yet"));
              } else {
                var requests = snapshot.data!.docs.where((element) {
                  if (element.data()["sender_id"].contains("abcd"))
                    return true;
                  else
                    return false;
                }).toList();
                return Container();
              }
            }
          } catch (e) {
            return Center(
              child: Text("Network Error!\n Please retry after sometime"),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => AddRequestsScreen()));
        },
        child: Icon(
          Icons.add,
          size: 30,
        ),
      ),
    );
  }
}
