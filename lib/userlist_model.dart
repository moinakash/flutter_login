// To parse this JSON data, do
//
//     final userListModel = userListModelFromJson(jsonString);

import 'dart:convert';

List<UserListModel> userListModelFromJson(String str) => List<UserListModel>.from(json.decode(str).map((x) => UserListModel.fromJson(x)));

String userListModelToJson(List<UserListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserListModel {
  UserListModel({
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
    this.others,
    this.designation,
    this.workPlace,
    this.type,
    this.workDistrict,
    this.homeDistrict,
    this.memberNo,
    this.batch,
    this.batchSession,
    this.dateOfBirth,
    this.bloodGroup,
    this.status,
    this.lastLogin,
    this.lastLogout,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
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
  dynamic others;
  String? designation;
  String? workPlace;
  String? type;
  String? workDistrict;
  String? homeDistrict;
  String? memberNo;
  String? batch;
  String? batchSession;
  String? dateOfBirth;
  String? bloodGroup;
  String? status;
  dynamic lastLogin;
  dynamic lastLogout;
  dynamic deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory UserListModel.fromJson(Map<String, dynamic> json) => UserListModel(
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
    others: json["others"],
    designation: json["designation"],
    workPlace: json["work_place"],
    type: json["type"],
    workDistrict: json["work_district"],
    homeDistrict: json["home_district"],
    memberNo: json["member_no"],
    batch: json["batch"],
    batchSession: json["batch_session"],
    dateOfBirth: json["date_of_birth"],
    bloodGroup: json["blood_group"],
    status: json["status"],
    lastLogin: json["last_login"],
    lastLogout: json["last_logout"],
    deletedAt: json["deleted_at"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
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
    "others": others,
    "designation": designation,
    "work_place": workPlace,
    "type": type,
    "work_district": workDistrict,
    "home_district": homeDistrict,
    "member_no": memberNo,
    "batch": batch,
    "batch_session": batchSession,
    "date_of_birth": dateOfBirth,
    "blood_group": bloodGroup,
    "status": status,
    "last_login": lastLogin,
    "last_logout": lastLogout,
    "deleted_at": deletedAt,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
