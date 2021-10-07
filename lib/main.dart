import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_login/employee_list.dart';
import 'package:flutter_login/user_details_model.dart';
import 'package:flutter_login/view_.user.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

void main() {
  runApp(const Main());
}


class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,

      initialRoute: '/',
      //when initial Route is given no need to add home widget for initial start point of app
      //full app route structure
      routes: {
        '/':(context)=> MyApp(),
        '/employeeList':(context)=>EmployeeList(),
        // '/reg':(context)=>Registration(),
        // '/dashboard':(context)=>Dashboard()
      },

    );
  }
}



class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

Future<UserDetailsModel?> userDetailsModel(
    String contact, String password) async {
  var apiUrl = Uri.parse('http://172.16.153.3:8000/api/v1/user/api/login');
  // final String apiUrl = "https://reqres.in/api/users";

  final response =
      await http.post(apiUrl, body: {"contact": contact, "password": password});

  final String responseString = response.body;
  return userDetailsModelFromJson(responseString);
}

class _MyAppState extends State<MyApp> {
  UserDetailsModel? _user;
  String? _value;
  final TextEditingController contactController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Login Screen'),
          backgroundColor: Colors.deepOrange,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                TextField(
                  controller: contactController,
                ),
                const SizedBox(
                  height: 50,
                ),
                TextField(
                  controller: passwordController,
                ),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 40, left: 40),
                  child: InkWell(
                    onTap: () => Get.to(ViewUser(), arguments: 4)

                   /* async {
                      final String name = contactController.text;
                      final String jobTitle = passwordController.text;

                      final UserDetailsModel? user =
                          await userDetailsModel(name, jobTitle);

                    setState(() {
                        _user = user!;
                      });


                    Get.to(ViewUser(), arguments: _user!.id);


                      if(_user?.dateOfBirth != null) setState(()=> _value = _user?.dateOfBirth.toString().substring(0,10));

                      print(
                          "ID : ${_user?.id} \nNAME : ${_user?.name} \nBATCH : ${_user?.batch} \nCONTACT : ${_user?.contact} \nDATE : ${_user?.dateOfBirth}");
                    }*/


                    ,
                    child: Container(
                        color: Colors.deepOrange,
                        width: double.infinity,
                        height: 50,
                        child: const Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Submit',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ))),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Text(
                    "ID : ${_user?.id} \nNAME : ${_user?.name} \nBATCH : ${_user?.batch} \nCONTACT : ${_user?.contact} \nDATE : ${_value}"),
                const SizedBox(
                  height: 50,
                ),

                InkWell(

                  onTap: (){

                    print("hello");

                     Get.toNamed("/employeeList");

                  },

                  child: Text('Next Page', style: TextStyle( fontWeight: FontWeight.bold),),



                )

              ],
            ),
          ),
        ),

    );
  }
}
