// ignore_for_file: must_be_immutable
import 'train_bookmarks.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'train_details.dart';

Map mapResponse = {};
List listResponse = [];

class TrainData extends StatefulWidget {
  TrainData({super.key, required this.journeyStart,required this.journeyEnd});

  String journeyStart;
  String journeyEnd;

  @override
  State<TrainData> createState() => _TrainDataState();
}

class _TrainDataState extends State<TrainData> {
  Future<dynamic> apiCall1() async {
    Map<String, dynamic> mapdata1 = {
      "fromStationCode" : widget.journeyStart,
      "toStationCode" : widget.journeyEnd,
    };
    http.Response response;

     response = await http.get(Uri.https('irctc1.p.rapidapi.com', '/api/v2/trainBetweenStations', mapdata1), headers: {
       "X-RapidAPI-Key": "bc023e1344msh3da61233fcaa268p143877jsn82e2c059fbe6",
       "X-RapidAPI-Host": "irctc1.p.rapidapi.com",});
    if (response.statusCode == 200) {
      setState(() {
        mapResponse = json.decode(response.body);
        listResponse = mapResponse['data'];
      });
    }
  }


  @override
  void initState() {
    apiCall1();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black38,
        appBar: AppBar(
          title: const Text(
            'Trains Available',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.bookmark),
              tooltip: 'Train Bookmarks',
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Bookmarks()),);
              },
            ), //IconButton
          ],
          titleSpacing: 00.0,
          centerTitle: true,
          toolbarHeight: 60.2,
          toolbarOpacity: 1.0,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(25),
                bottomLeft: Radius.circular(25)),
          ),
          elevation: 5.00,
          backgroundColor: Colors.black38,
        ),
        body: SafeArea(
          child: ListView.builder(itemBuilder: (context, index){
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 130,
                child: Card(
                  color: Colors.white,
                  // shape: RoundedRectangleBorder(
                  //   borderRadius: BorderRadius.circular(30.0),
                  // ),
                  child: Column(
                    children: [
                      Container(
                          padding: const EdgeInsets.fromLTRB(20.0,10.0,20.0,0.0),
                          child: Column(
                            
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0.0, 8.0, 8.0, 8.0),
                                child: Row(
                                  children: [
                                    const Text(
                                      "Train Number : ",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(color: Colors.black, fontSize: 16),
                                    ),
                                    Text(
                                      listResponse[index]['train_number'].toString(),
                                      textAlign: TextAlign.left,
                                      style: const TextStyle(color: Colors.black, fontSize: 16),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0.0, 5.0, 8.0, 0.0),
                                child: Row(
                                  children: [
                                    const Text(
                                      "Train Name : ",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(color: Colors.black, fontSize: 16),
                                    ),
                                    Expanded(
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Text(
                                          listResponse[index]['train_name'].toString(),
                                          textAlign: TextAlign.left,
                                          style: const TextStyle(color: Colors.black, fontSize: 16),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  MaterialButton(
                                    padding: const EdgeInsets.all(6),
                                    color: Colors.white54,
                                    onPressed: (){
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => TrainDetails(trainNo: listResponse[index]['train_number'] ),
                                          ));
                                    },
                                    child: const Text(
                                      "Get Details",
                                      style: TextStyle(color: Colors.black, fontSize: 14),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
            itemCount: listResponse.length ,
          ),
        )
    );
  }
}