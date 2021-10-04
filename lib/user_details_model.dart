// To parse this JSON data, do
//
//     final userDetailsModel = userDetailsModelFromJson(jsonString);

import 'dart:convert';

UserDetailsModel userDetailsModelFromJson(String str) => UserDetailsModel.fromJson(json.decode(str));

String userDetailsModelToJson(UserDetailsModel data) => json.encode(data.toJson());

class UserDetailsModel {
  UserDetailsModel({
    this.id,
    this.name,
    this.nickName,
    this.email,
    this.emailVerifiedAt,
    this.photo,
    this.contact,
    this.parmanentAddress,
    this.livingCountry,
    this.countryType,
    this.profession,
    this.designation,
    this.workPlace,
    this.type,
    this.workDistrict,
    this.homeDistrict,
    this.batch,
    this.batchSession,
    this.dateOfBirth,
    this.bloodGroup,
  });

  int? id;
  String? name;
  String? nickName;
  String? email;
  dynamic emailVerifiedAt;
  dynamic photo;
  String? contact;
  String? parmanentAddress;
  String? livingCountry;
  String? countryType;
  String? profession;
  String? designation;
  String? workPlace;
  String? type;
  String? workDistrict;
  String? homeDistrict;
  String? batch;
  String? batchSession;
  DateTime? dateOfBirth;
  String? bloodGroup;

  factory UserDetailsModel.fromJson(Map<String, dynamic> json) => UserDetailsModel(
    id: json["id"],
    name: json["name"],
    nickName: json["nick_name"],
    email: json["email"],
    emailVerifiedAt: json["email_verified_at"],
    photo: json["photo"],
    contact: json["contact"],
    parmanentAddress: json["parmanent_address"],
    livingCountry: json["living_country"],
    countryType: json["country_type"],
    profession: json["profession"],
    designation: json["designation"],
    workPlace: json["work_place"],
    type: json["type"],
    workDistrict: json["work_district"],
    homeDistrict: json["home_district"],
    batch: json["batch"],
    batchSession: json["batch_session"],
    dateOfBirth: DateTime.parse(json["date_of_birth"]),
    bloodGroup: json["blood_group"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "nick_name": nickName,
    "email": email,
    "email_verified_at": emailVerifiedAt,
    "photo": photo,
    "contact": contact,
    "parmanent_address": parmanentAddress,
    "living_country": livingCountry,
    "country_type": countryType,
    "profession": profession,
    "designation": designation,
    "work_place": workPlace,
    "type": type,
    "work_district": workDistrict,
    "home_district": homeDistrict,
    "batch": batch,
    "batch_session": batchSession,
    //"date_of_birth": "${dateOfBirth?.year.toString().padLeft(4, '0')}-${dateOfBirth?.month.toString().padLeft(2, '0')}-${dateOfBirth?.day.toString().padLeft(2, '0')}",
    "date_of_birth":dateOfBirth?.day,
    "blood_group": bloodGroup,
  };
}
