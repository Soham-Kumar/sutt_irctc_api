import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class ProfileController with ChangeNotifier{
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
                    // pickCameraImage(context);
                  },
                  leading: Icon(Icons.camera_alt_sharp),
                  title: const Text('Camera'),

                ),
                ListTile(
                  onTap: (){

                  },
                  leading: Icon(Icons.image),
                  title: const Text('Gallery'),

                )
              ],
            )
          )
        );
      }
    );
  }
}