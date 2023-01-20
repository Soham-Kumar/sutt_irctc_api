import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'journey_bookmark.dart';


// ignore: must_be_immutable
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
    Uri uri = Uri.https('irctc1.p.rapidapi.com','/api/v1/getTrainSchedule',mapdat2);
    response = await http.get(uri, headers: {
      "X-RapidAPI-Key": "bc023e1344msh3da61233fcaa268p143877jsn82e2c059fbe6",
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
      backgroundColor: Colors.black38,
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.bookmark),
            tooltip: 'Train Bookmarks',
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const TrainBookmarks()),);

            },
          ), //IconButton
        ],
        title: const Text(
          'Train Details',
          style: TextStyle(color: Colors.white, fontSize: 24),
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
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(itemBuilder: (context, index){
          String str;
          return Card(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
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
                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Text(
                            listResponse1[index]['station_name'].toString(),
                            textAlign: TextAlign.left,
                            style: const TextStyle(color: Colors.black, fontSize: 16),
                          ),
                        ),
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