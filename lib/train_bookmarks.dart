import 'package:flutter/material.dart';
import 'package:sutt_irctc_api/train_bw_stations.dart';
import 'package:sutt_irctc_api/train_details.dart';
import 'package:firebase_storage/firebase_storage.dart';


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
        backgroundColor: Colors.black38,
        appBar: AppBar(
          title: const Text(
            'Train Bookmarks',
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
    )
    );
  }
}
