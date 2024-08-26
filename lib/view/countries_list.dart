import 'package:covidapp4/services/states_services.dart';
import 'package:covidapp4/view/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CountriesList extends StatefulWidget {
  const CountriesList({super.key});

  @override
  State<CountriesList> createState() => _CountriesListState();
}

class _CountriesListState extends State<CountriesList> {
  TextEditingController searchcontroller = TextEditingController();
  StatesServices statesServices = StatesServices();

  @override
  Widget build(BuildContext context) {
    final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    final isKeyboardVisible = keyboardHeight > 0;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        // Navigator.pop(context);
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              FocusScope.of(context).unfocus();
              Navigator.pop(context);
            },
          ),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        ),
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding:  const EdgeInsets.all(8.0),
                child: TextFormField(
                  onChanged: (value) {
                    setState(() {});
                  },
                  controller: searchcontroller,
                  decoration: InputDecoration(
                      hintText: "Search with Country name",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50))),
                ),
              ),
              Expanded(
                  child: FutureBuilder(
                      future: statesServices.fetchcountrieslistapi(),
                      builder:
                          (context, AsyncSnapshot<List<dynamic>> snapshot) {
                        if (!snapshot.hasData) {
                          return ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                              itemCount: 4,
                              itemBuilder: (context, index) {
                                return Shimmer.fromColors(
                                    baseColor: Colors.grey.shade100,
                                    highlightColor: Colors.grey.shade700,
                                    child: Column(
                                      children: [
                                        ListTile(
                                          leading: Container(
                                            height: 50,
                                            width: 50,
                                            color: Colors.white,
                                          ),
                                          subtitle: Container(
                                            height: 10,
                                            width: 89,
                                            color: Colors.white,
                                          ),
                                          title: Container(
                                            height: 10,
                                            width: 89,
                                            color: Colors.white,
                                          ),
                                        )
                                      ],
                                    ));
                              });
                        } else {
                          return ListView.builder(
                            scrollDirection: Axis.vertical,
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                String name =
                                    snapshot.data![index]["country"].toString();
                                if (searchcontroller.text.isEmpty) {
                                  return Column(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => DetailsScreen(
                                                      test: snapshot.data![index]
                                                          ["tests"],
                                                      name: snapshot.data![index]
                                                          ["country"],
                                                      critical: snapshot.data![index]
                                                          ["critical"],
                                                      active: snapshot.data![index]
                                                          ["active"],
                                                      image: snapshot.data![index]
                                                              ["countryInfo"]
                                                          ["flag"],
                                                      todayrecovered: snapshot.data![index]
                                                          ["todayRecovered"],
                                                      totalcases: snapshot.data![index]
                                                          ["cases"],
                                                      totaldeaths:
                                                          snapshot.data![index]
                                                              ["deaths"])));
                                        },
                                        child: ListTile(
                                          title: Text(snapshot.data![index]
                                                  ["country"]
                                              .toString()),
                                          subtitle: Text(snapshot.data![index]
                                                  ["cases"]
                                              .toString()),
                                          leading: Image(
                                            height: 50,
                                            width: 50,
                                            image: NetworkImage(
                                                snapshot.data![index]
                                                    ["countryInfo"]["flag"]),
                                          ),
                                        ),
                                      )
                                    ],
                                  );
                                } else if (name.toLowerCase().contains(
                                    searchcontroller.text.toLowerCase())) {
                                  return Column(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => DetailsScreen(
                                                      test: snapshot.data![index]
                                                          ["tests"],
                                                      name: snapshot.data![index]
                                                          ["country"],
                                                      critical: snapshot.data![index]
                                                          ["critical"],
                                                      active: snapshot.data![index]
                                                          ["active"],
                                                      image: snapshot.data![index]
                                                              ["countryInfo"]
                                                          ["flag"],
                                                      todayrecovered: snapshot.data![index]
                                                          ["todayRecovered"],
                                                      totalcases: snapshot.data![index]
                                                          ["cases"],
                                                      totaldeaths:
                                                          snapshot.data![index]
                                                              ["deaths"])));
                                        },
                                        child: ListTile(
                                          title: Text(snapshot.data![index]
                                                  ["country"]
                                              .toString()),
                                          subtitle: Text(snapshot.data![index]
                                                  ["cases"]
                                              .toString()),
                                          leading: Image(
                                            height: 50,
                                            width: 50,
                                            image: NetworkImage(
                                                snapshot.data![index]
                                                    ["countryInfo"]["flag"]),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                } else {
                                  return Container();
                                }
                              });
                        }
                      }))
            ],
          ),
        ),
      ),
    );
  }
}
