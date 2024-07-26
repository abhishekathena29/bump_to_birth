import 'package:bump_to_birth/core/navigation.dart';
import 'package:bump_to_birth/feature/doctor/model/doctor_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorPage extends StatelessWidget {
  DoctorPage({super.key});

  final DoctorModel model = DoctorModel(
      name: "Asdfg",
      email: "asdfg@gmail.com",
      hospitalName: "A@Z Hospital",
      hospitalContact: "8898745874",
      hospitalLocation: "jfbnfnmfnmbdfsnmbfdmnb",
      description: "dnm xbvfbmvcxnbmv",
      expertise: "Heart",
      addedDate: Timestamp.fromDate(DateTime.now()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(1.sw, 0.1.sh),
        child: Container(
          color: const Color(0xffF9ADB7),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  const SizedBox(width: 10),
                  IconButton(
                    onPressed: () {
                      moveBack(context);
                    },
                    icon: const Icon(Icons.arrow_back),
                    color: Colors.white,
                    iconSize: 35,
                  ),
                  const SizedBox(width: 20),
                  const Text(
                    'Doctors List',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
