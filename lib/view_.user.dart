import 'package:flutter/material.dart';
import 'package:flutter_login/update_profile.dart';
import 'package:flutter_login/view_user_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ViewUser extends StatefulWidget {
  const ViewUser({Key? key}) : super(key: key);

  @override
  _ViewUserState createState() => _ViewUserState();
}

String data = Get.arguments.toString();

Future<ViewUserModel> viewUserModel() async {
  var apiUrl =
      Uri.parse('http://172.16.153.3:8000/api/v1/user/setting/${data}');
  // final String apiUrl = "https://reqres.in/api/users";

  final response =
      await http.post(apiUrl, headers: {"Accept": "application/json"});

  final String responseString = response.body;

  //print(response.body);

  return viewUserModelFromJson(responseString);
}

class _ViewUserState extends State<ViewUser> {
  //final Future<ViewUserModel> vUserModel =  viewUserModel() ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(

          child: FutureBuilder<ViewUserModel>(
            future: viewUserModel(),
            builder: (context, snapshot) {
              return Column(

                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('name: ${snapshot.data?.name}'),
                  Text('designation: ${snapshot.data?.designation}'),
                  Text('dateOfBirth: ${snapshot.data?.dateOfBirth}'),
                  Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: NetworkImage(
                          "http://172.16.153.3:8000/${snapshot.data?.photo}"),
                      fit: BoxFit.fill,
                    )),
                    height: 300,
                    width: 200,
                    // child: Image.network("http://172.16.153.3:8000/${snapshot.data?.photo}")),
                  ),
                  IconButton(onPressed: () {

                    print('Hello');

                    Get.to(UpdateProfile());
                  }, icon: Icon(Icons.update),iconSize: 50,)
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
