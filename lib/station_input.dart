import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'train_bw_stations.dart';
import 'auth_service.dart';


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
    return MaterialApp(
      home: ChangeNotifierProvider(
        create: (_) => ProfileController,
    child: Consumer(
    builder: (context, provider, child){
    return Scaffold(
          backgroundColor: Colors.black38,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            actions: <Widget>[
              IconButton(
                iconSize: 35,
                icon: const Icon(
                  Icons.logout_sharp,
                  color: Colors.black,
                ),
                onPressed: () {
                  AuthService().signOut();
                },
              ),
          ],
            title: const Text(
              'Enter Stations',
              style: TextStyle(color: Colors.black, fontSize: 24),
            ),
            titleSpacing: 00.0,
            centerTitle: true,

          ),
          body: SafeArea(
            child: Column(
              children: <Widget>[
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 64.0, 8.0, 8.0),
                      child: Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.black,
                        )
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(150),
                      ),
                  ),
                    ),
                    InkWell(
                      onTap: (){
                      },
                      child: CircleAvatar(
                        radius: 12,
                        backgroundColor: Colors.black,
                        child: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 14,
                        ),
                      ),
                    )
                  ],
                ),
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
        ),
      ),
      ),
    );
  }
}