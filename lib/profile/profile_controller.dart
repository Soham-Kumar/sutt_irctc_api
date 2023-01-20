import 'dart:io';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:basic_utils/basic_utils.dart';

class ProfileController with ChangeNotifier{
  final picker = ImagePicker();


  DatabaseReference ref = FirebaseDatabase.instance.ref().child('user');
  firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance;


  XFile? _image;
  XFile? get image => _image;

  Future pickGalleryImage(BuildContext context) async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if(pickedFile != null) {
      _image = XFile(pickedFile.path);
      notifyListeners();
    }
  }

  Future pickCameraImage(BuildContext context) async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if(pickedFile != null) {
      _image = XFile(pickedFile.path);
      notifyListeners();
    }
  }

  void imagePicker(context){
    showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          content: SizedBox(
            height: 120,
            child: Column(
              children: [
                ListTile(
                  onTap: (){
                    pickCameraImage(context);
                    Navigator.pop(context);
                  },
                  leading: const Icon(Icons.camera_alt_sharp),
                  title: const Text('Camera'),

                ),
                ListTile(
                  onTap: (){
                    pickGalleryImage(context);
                    Navigator.pop(context);
                  },
                  leading: const Icon(Icons.image),
                  title: const Text('Gallery'),

                )
              ],
            )
          )
        );
      }
    );
  }

  void uploadImage(BuildContext context) async {

  }
}