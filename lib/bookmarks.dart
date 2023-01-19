import 'package:flutter/material.dart';
import 'package:sutt_irctc_api/train_bw_stations.dart';
import 'package:sutt_irctc_api/train_details.dart';

class Bookmarks extends StatefulWidget {
  const Bookmarks({Key? key}) : super(key: key);

  @override
  State<Bookmarks> createState() => _BookmarksState();
}

class _BookmarksState extends State<Bookmarks> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView.builder(itemBuilder: (context, index){
          return SizedBox(
            height: 180,
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
                                // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
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
          );
    }
      )
    )
    );
  }
}
