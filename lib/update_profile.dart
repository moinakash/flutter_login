import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({Key? key}) : super(key: key);

  @override
  _UpdateProfileState createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {

  TextEditingController NameController = TextEditingController( text: "hello");

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: Text("Update Profile"),),

      body: Container(
        
        margin: EdgeInsets.all(20),
        
        child: Column(
          
          
          
          children: [

            TextFormField(
              controller: NameController,
              decoration: const InputDecoration(
                labelText: 'Label text',
                border: OutlineInputBorder(),

              ),
            ),


          ],
        ),
      ),

    );
  }
}
