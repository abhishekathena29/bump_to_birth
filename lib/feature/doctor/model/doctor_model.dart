import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class DoctorModel {
  String name;
  String email;
  String hospitalName;
  String hospitalContact;
  String hospitalLocation;
  String description;
  String expertise;
  Timestamp addedDate;
  DoctorModel({
    required this.name,
    required this.email,
    required this.hospitalName,
    required this.hospitalContact,
    required this.hospitalLocation,
    required this.description,
    required this.expertise,
    required this.addedDate,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'hospitalName': hospitalName,
      'hospitalContact': hospitalContact,
      'hospitalLocation': hospitalLocation,
      'description': description,
      'expertise': expertise,
      'addedDate': addedDate,
    };
  }

  factory DoctorModel.fromMap(Map<String, dynamic> map) {
    return DoctorModel(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      hospitalName: map['hospitalName'] ?? '',
      hospitalContact: map['hospitalContact'] ?? '',
      hospitalLocation: map['hospitalLocation'] ?? '',
      description: map['description'] ?? '',
      expertise: map['expertise'] ?? '',
      addedDate: map['addedDate'],
    );
  }

  String toJson() => json.encode(toMap());

  factory DoctorModel.fromJson(String source) =>
      DoctorModel.fromMap(json.decode(source));
}
