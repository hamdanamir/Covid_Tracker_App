import 'package:covidapp4/modal/WorldStatesApi.dart';
import 'package:covidapp4/services/states_services.dart';
import 'package:covidapp4/view/countries_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';

// class WorldStates extends StatefulWidget {
//   const WorldStates({super.key});
//
//   @override
//   State<WorldStates> createState() => _WorldStatesState();
// }
//
// class _WorldStatesState extends State<WorldStates>
//     with TickerProviderStateMixin {
//   late final AnimationController _controller =
//       AnimationController(duration: const Duration(seconds: 3), vsync: this)
//         ..repeat();
//
//   final colorlist = <Color>[
//     const Color(0xff4285F4),
//     const Color(0xff1aa268),
//     const Color(0xffde5246)
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     StatesServices statesServices = StatesServices();
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(15.0),
//           child: Column(
//             // mainAxisSize: MainAxisSize.min,
//             children: [
//               SizedBox(
//                 height: MediaQuery.sizeOf(context).height * .01,
//               ),
//               FutureBuilder<WorldStatesModal>(
//                   future: statesServices.fetchworldstatesrecords(),
//                   builder: (context, AsyncSnapshot<WorldStatesModal> snapshot) {
//                     if (!snapshot.hasData) {
//                       return Expanded(
//                         flex: 1,
//                         child: SpinKitFadingCircle(
//                           controller: _controller,
//                           size: 50,
//                           color: Colors.green,
//                         ),
//                       );
//                     } else {
//                       return Column(
//                         children: [
//                           PieChart(
//                             chartRadius: MediaQuery.sizeOf(context).width / 3.2,
//                             dataMap: {
//                               "Total":
//                                   double.parse(snapshot.data!.cases.toString()),
//                               "Recovered": double.parse(
//                                   snapshot.data!.recovered.toString()),
//                               "Deaths":
//                                   double.parse(snapshot.data!.deaths.toString())
//                             },
//                             chartValuesOptions: const ChartValuesOptions(
//                               showChartValuesInPercentage: true,
//                             ),
//                             animationDuration: const Duration(milliseconds: 1200),
//                             chartType: ChartType.ring,
//                             colorList: colorlist,
//                             legendOptions: const LegendOptions(
//                                 legendPosition: LegendPosition.left),
//                           ),
//                           Padding(
//                             padding: EdgeInsets.symmetric(
//                                 vertical:
//                                     MediaQuery.sizeOf(context).height * .06),
//                             child: Card(
//                               child: Padding(
//                                 padding: const EdgeInsets.only(
//                                     top: 10, left: 10, bottom: 5, right: 10),
//                                 child: Column(
//                                   children: [
//                                     reuseableorw(
//                                         value: snapshot.data!.cases.toString(),
//                                         title: "Total"),
//                                     reuseableorw(
//                                         value: snapshot.data!.deaths.toString(),
//                                         title: "Deaths"),
//                                     reuseableorw(
//                                         value:
//                                             snapshot.data!.recovered.toString(),
//                                         title: "Recovered"),
//                                     reuseableorw(
//                                         value: snapshot.data!.active.toString(),
//                                         title: "Active"),
//                                     reuseableorw(
//                                         value:
//                                             snapshot.data!.critical.toString(),
//                                         title: "Critical"),
//                                     reuseableorw(
//                                         value: snapshot.data!.todayDeaths
//                                             .toString(),
//                                         title: "Totally Deaths"),
//                                     reuseableorw(
//                                         value: snapshot.data!.todayRecovered
//                                             .toString(),
//                                         title: "Totally Recovered")
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                           GestureDetector(
//                             onTap: () {
//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (_) => const CountriesList()));
//                             },
//                             child: Container(
//                               height: MediaQuery.sizeOf(context).height*.1,
//                               decoration: BoxDecoration(
//                                   color: const Color(0xff1aa260),
//                                   borderRadius: BorderRadius.circular(10)),
//                               child:
//                                   const Center(child: Text("Track Countries")),
//                             ),
//                           )
//                         ],
//                       );
//                     }
//                   }),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class reuseableorw extends StatelessWidget {
//   String title, value;
//
//   reuseableorw({super.key, required this.value, required this.title});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [Text(title), Text(value)],
//         ),
//         const SizedBox(
//           height: 5,
//         ),
//         const Divider()
//       ],
//     );
//   }
// }
class WorldStates extends StatefulWidget {
  const WorldStates({super.key});

  @override
  State<WorldStates> createState() => _WorldStatesState();
}

class _WorldStatesState extends State<WorldStates>
    with TickerProviderStateMixin {
  late final AnimationController _controller =
  AnimationController(duration: const Duration(seconds: 3), vsync: this)
    ..repeat();

  final colorlist = <Color>[
    const Color(0xff4285F4),
    const Color(0xff1aa268),
    const Color(0xffde5246)
  ];

  @override
  Widget build(BuildContext context) {
    StatesServices statesServices = StatesServices();
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              SizedBox(height: screenHeight * 0.01),
              FutureBuilder<WorldStatesModal>(
                future: statesServices.fetchworldstatesrecords(),
                builder: (context, AsyncSnapshot<WorldStatesModal> snapshot) {
                  if (!snapshot.hasData) {
                    return Expanded(
                      child: Center(
                        child: SpinKitFadingCircle(
                          controller: _controller,
                          size: 50,
                          color: Colors.green,
                        ),
                      ),
                    );
                  } else {
                    return Column(
                      children: [
                        PieChart(
                          chartRadius: screenWidth / 3.2,
                          dataMap: {
                            "Total": double.parse(snapshot.data!.cases.toString()),
                            "Recovered": double.parse(snapshot.data!.recovered.toString()),
                            "Deaths": double.parse(snapshot.data!.deaths.toString()),
                          },
                          chartValuesOptions: const ChartValuesOptions(
                            showChartValuesInPercentage: true,
                          ),
                          animationDuration: const Duration(milliseconds: 1200),
                          chartType: ChartType.ring,
                          colorList: colorlist,
                          legendOptions: const LegendOptions(
                            legendPosition: LegendPosition.left,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: screenHeight * 0.06),
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  ReuseableRow(
                                    title: "Total",
                                    value: snapshot.data!.cases.toString(),
                                  ),
                                  ReuseableRow(
                                    title: "Deaths",
                                    value: snapshot.data!.deaths.toString(),
                                  ),
                                  ReuseableRow(
                                    title: "Recovered",
                                    value: snapshot.data!.recovered.toString(),
                                  ),
                                  ReuseableRow(
                                    title: "Active",
                                    value: snapshot.data!.active.toString(),
                                  ),
                                  ReuseableRow(
                                    title: "Critical",
                                    value: snapshot.data!.critical.toString(),
                                  ),
                                  ReuseableRow(
                                    title: "Today's Deaths",
                                    value: snapshot.data!.todayDeaths.toString(),
                                  ),
                                  ReuseableRow(
                                    title: "Today's Recovered",
                                    value: snapshot.data!.todayRecovered.toString(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const CountriesList(),
                              ),
                            );
                          },
                          child: Container(
                            height: screenHeight * 0.1,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: const Color(0xff1aa260),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Center(
                              child: Text(
                                "Track Countries",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ReuseableRow extends StatelessWidget {
  final String title, value;

  const ReuseableRow({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Column(
        children: [
          Row(

            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
              Text(value),
            ],
          ),
          const Divider(),
        ],
      ),
    );
  }
}
