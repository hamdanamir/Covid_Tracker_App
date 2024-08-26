import 'package:covidapp4/view/world_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  String name, image;
  int totalcases, totaldeaths, active, critical, todayrecovered, test;

  DetailsScreen(
      {required this.name,
      required this.critical,
      required this.active,
      required this.image,
      required this.test,
      required this.todayrecovered,
      required this.totalcases,
      required this.totaldeaths});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.sizeOf(context).height * .067),
                child: Card(
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height*.067,
                      ),
                      ReuseableRow(
                          value: widget.totalcases.toString(), title: "Cases"),
                      ReuseableRow(
                          value: widget.active.toString(), title: "Active"),
                      ReuseableRow(
                          value: widget.todayrecovered.toString(), title: "Recovered"),
                      ReuseableRow(
                          value: widget.totaldeaths.toString(), title: "Deaths"),
                      ReuseableRow(
                          value: widget.critical.toString(), title: "Critical"),
                      ReuseableRow(
                          value: widget.test.toString(), title: "Test")
                    ],
                  ),
                ),
              ),
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(widget.image),
              )
            ],
          )
        ],
      ),
    );
  }
}
