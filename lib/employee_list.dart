import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_login/user_details_model.dart';
import 'package:flutter_login/userlist_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EmployeeList extends StatefulWidget {
  const EmployeeList({Key? key}) : super(key: key);

  @override
  _EmployeeListState createState() => _EmployeeListState();
}



Future<List<UserListModel?>> userDetailsModel() async {
  var apiUrl = Uri.parse('http://172.16.153.3:8000/api/v1/user/search');
  // final String apiUrl = "https://reqres.in/api/users";

  final response =
  await http.post(apiUrl, body: {"profession": "", "home_district": "",
    "batch": "", "batch_session": "",
    "blood_group": "", "work_district": ""},
      headers: {"Accept": "application/json"});

  final String responseString = response.body;


  //print(response.body);

  return userListModelFromJson(responseString);
}

class _EmployeeListState extends State<EmployeeList> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   // userDetailsModel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(title: Text('Employee List') ,
        ),
        body: SingleChildScrollView(

          child: FutureBuilder<List<UserListModel?>>(
            future: userDetailsModel(),
            builder: (context,snapshot){

              if (snapshot.hasData) {
                return Container(
                  child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: snapshot.data?.length,
                      //itemCount: data ==null? 0 : data!.length,
                      itemBuilder: (context, index) =>

                          MyCardList(
                              id: "${snapshot.data?[index]!.name}",
                              title: "${snapshot.data?[index]!.contact}",
                              dec: "${snapshot.data?[index]!.designation}")


                    

                  ),
                );

               
              }
              return const Center(
                child: CircularProgressIndicator(),
              );

            },

          ),
        ),


    );
  }
}


final List _selecteCategorys = List.empty(growable: true);

class MyCardList extends StatefulWidget {
  final String id;
  final String title;
  final String dec;

  //final Function function;

  MyCardList({
    required this.id,
    required this.title,
    required this.dec,
  });

  //const MyCardList({Key? key}) : super(key: key);

  @override
  _MyCardListState createState() => _MyCardListState();
}


class _MyCardListState extends State<MyCardList> {



  void _onCategorySelected(bool selected, category_id) {
    if (selected == true) {
      setState(() {
        _selecteCategorys.add(category_id);
        print(_selecteCategorys);
      });
    } else {
      setState(() {
        _selecteCategorys.remove(category_id);
        print(_selecteCategorys);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      
      margin: EdgeInsets.only(left:10, top: 10, right: 10),
      
      child: Card(
        
        child: Padding(
          
          padding: EdgeInsets.all(20),
          
          child: Column(
            children: [
              Text(widget.id ,style: TextStyle(fontWeight: FontWeight.bold),),
              SizedBox(height: 10,),
              Text(widget.title),
              Text(widget.dec),
              Checkbox(
                value: _selecteCategorys.contains(widget.id ) ,
                onChanged: (selected) {_onCategorySelected(selected!, widget.id );
              },)
            ],
          ),
        ),
      ),
    );
  }
}