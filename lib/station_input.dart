import 'dart:io';

import 'package:flutter/material.dart';
import 'train_bw_stations.dart';
import 'profile/profile_controller.dart';
import 'auth_service.dart';
import 'package:provider/provider.dart';

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
      backgroundColor: Colors.black12,
      appBar: AppBar(
        title: const Text(
          'Enter Stations',
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
        backgroundColor: Colors.black12,
      ),
      body: ChangeNotifierProvider(
        create: (_) => ProfileController(),
        child: Consumer<ProfileController>(
          builder: (context, provider, child){
            return SafeArea(
              child: Column(
                children: <Widget>[
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8.0, 12.0, 8.0, 8.0),
                        child: Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white,
                              )
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: provider.image == null ? const Icon(Icons.person, size: 35,):
                            Image.file(
                              File(provider.image!.path).absolute
                            )
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          provider.imagePicker(context);
                        },
                        child: CircleAvatar(
                          radius: 12,
                          backgroundColor: Colors.blueGrey,
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 14,
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: const EdgeInsets.all(20.0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          icon: Icon(Icons.train, color: Colors.white,),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                          ),                      labelText: 'Start Station',
                          labelStyle: TextStyle(color: Colors.grey),
                        ),
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        controller: journeyStartTEC,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20.0),
                    child: TextFormField(

                      decoration: const InputDecoration(
                        icon: Icon(Icons.train, color: Colors.white,),
                        labelText: 'Destination Station',
                        labelStyle: TextStyle(color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                      ),

                      style: const TextStyle(
                        color: Colors.white,
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
            );
          }
        )
      ),
    );
  }
}