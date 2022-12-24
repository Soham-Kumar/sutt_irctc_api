import 'package:flutter/material.dart';
import 'train_bw_stations.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String journeyStart = '';
  String journeyEnd = '';
  TextEditingController journeyStartTEC = TextEditingController();
  TextEditingController journeyEndTEC = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Enter Stations',
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
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                decoration: const InputDecoration(labelText: 'Start Station'),
                style: const TextStyle(
                  color: Colors.black,
                ),
                controller: journeyStartTEC,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                decoration: const InputDecoration(labelText:
                'Destination',
                ),

                style: const TextStyle(
                  color: Colors.black,
                ),
                controller: journeyEndTEC,
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.greenAccent[400],
                padding: const EdgeInsets.all(10),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              onPressed: () {
                setState(() {
                  journeyStart = journeyStartTEC.text;
                  journeyEnd = journeyEndTEC.text;
                });
                Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => TrainData( journeyStart: journeyStart.toString() , journeyEnd: journeyEnd.toString(),),
                    ));
              },
              child: const Text(
                'Get Trains',
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}