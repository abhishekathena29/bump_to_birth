import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class MedicineModel {
  String medicine_name;
  String time;
  Timestamp addedDate;
  MedicineModel({
    required this.medicine_name,
    required this.time,
    required this.addedDate,
  });

  Map<String, dynamic> toMap() {
    return {
      'medicine_name': medicine_name,
      'time': time,
      'addedDate': addedDate,
    };
  }

  factory MedicineModel.fromMap(Map<String, dynamic> map) {
    return MedicineModel(
      medicine_name: map['name'] ?? '',
      time: map['email'] ?? '',
      addedDate: map['addedDate'],
    );
  }

  String toJson() => json.encode(toMap());

  factory MedicineModel.fromJson(String source) =>
      MedicineModel.fromMap(json.decode(source));
}
