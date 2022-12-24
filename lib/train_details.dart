import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class TrainDetails extends StatefulWidget {
  TrainDetails({super.key, required this.trainNo});


  String trainNo;

  @override
  State<TrainDetails> createState() => _TrainDetailsState();
}

Map trainResponse = {};
List listResponse1 = [];


class _TrainDetailsState extends State<TrainDetails> {


  Future<dynamic> apiCall2() async {

    Map<String, dynamic> mapdat2 = {
      "trainNo" : widget.trainNo,
    };
    http.Response response;
    Uri uri = Uri.https('irctc1.p.rapidapi.com','api/v1/getTrainSchedule',mapdat2);
    response = await http.get(uri, headers: {
      "X-RapidAPI-Key": "b9dcd93668msh845190a4a47e113p1289cajsn083f6026f6db",
      "X-RapidAPI-Host": "irctc1.p.rapidapi.com",});
    if (response.statusCode == 200) {
      setState(() {
        trainResponse = json.decode(response.body);
        listResponse1 = trainResponse['data']['route'];
      });
    }
  }

  @override
  void initState() {
    apiCall2();
    super.initState();
  }

  TextEditingController stationInputTEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Train Details',
          style: TextStyle(color: Colors.black, fontSize: 24),
        ),
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
        backgroundColor: Colors.greenAccent[400],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(itemBuilder: (context, index){
          String str;
          return Card(
            color: Colors.greenAccent[400],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(28.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Text(
                        "Station Code : ",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      Text(
                        listResponse1[index]['station_code'].toString(),
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: const TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        "Station Name is : ",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      Text(
                        listResponse1[index]['station_name'].toString(),
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: const TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        "Day it is passing through is : ",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      Text(
                        listResponse1[index]['day'].toString(),
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: const TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ],
                  ),
                  Row(
                    children: [

                      const Text(
                        "Distance from source is : ",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      Text(
                        listResponse1[index]['distance_from_source'].toString(),
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: const TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        listResponse1[index]['stop'].toString() == 'true' ? str = 'Train will stop on this station' : str = 'Train will not stop on this station',
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: const TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
          itemCount: listResponse1.length ,
        ),
      ),

    );
  }
}