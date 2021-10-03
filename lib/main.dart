import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_login/user_details_model.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

  Future<UserDetailsModel?> userDetailsModel(String contact,String password) async{

    var apiUrl = Uri.parse('http://172.16.153.3:8000/api/v1/user/api/login');
    // final String apiUrl = "https://reqres.in/api/users";

    final response =
    await http.post(apiUrl, body: {"contact": contact, "password": password});


      final String responseString = response.body;
      return userDetailsModelFromJson(responseString);



}

class _MyAppState extends State<MyApp> {

  UserDetailsModel? _user;
  final TextEditingController contactController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {



    return MaterialApp(

      debugShowCheckedModeBanner: false,

      home: Scaffold(

        appBar: AppBar(title: Text('Login Screen'), backgroundColor: Colors.deepOrange, centerTitle: true,),
        body: Container(
          child: Column(
            children: [
              SizedBox(height: 50,),
              TextField(
                controller: contactController,
              ),
              SizedBox(height: 50,),
              TextField(
                controller: passwordController,

              ),
              SizedBox(height: 50,),
              Padding(
                
                padding: EdgeInsets.only(right: 40,left: 40),
                
                child: InkWell(


                  onTap: () async{

                    final String name = contactController.text;
                    final String jobTitle = passwordController.text;

                    final UserDetailsModel? user = await userDetailsModel(name, jobTitle);

                    this.setState(() {
                      _user = user!;



                    });

                    print("ID : ${_user?.id} \nNAME : ${_user?.name} \nBATCH : ${_user?.batch} \nCONTACT : ${_user?.contact} \n DATE : ${_user?.dateOfBirth}");

                  },

                  child: Container(
                    color: Colors.deepOrange,
                    width: double.infinity,
                      height: 50,
                      child: Align(

                        alignment: Alignment.center,

                          child: Text('Submit', style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold),))),
                ),
              ),

              SizedBox(height: 50,),

              Container(
                child:

                  Text("ID : ${_user?.id} \nNAME : ${_user?.name} \nBATCH : ${_user?.batch} \nCONTACT : ${_user?.contact} \n DATE : ${_user?.dateOfBirth}")


        ),

            ],
          ),
        ),
      ),
    );
  }
}
