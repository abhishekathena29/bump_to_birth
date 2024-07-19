import 'package:bump_to_birth/core/navigation.dart';
import 'package:bump_to_birth/feature/medicine/medicine_model.dart';
//import 'package:bump_to_birth/feature/doctor/model/doctor_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MedicinePage extends StatelessWidget {
  MedicinePage({super.key});
  final List<MedicineModel> medicinelist = [
    MedicineModel(
        medicine_name: "paracetomol",
        time: "morning",
        addedDate: Timestamp.fromDate(DateTime.now())),
    MedicineModel(
        medicine_name: "roxid",
        time: "night",
        addedDate: Timestamp.fromDate(DateTime.now())),
  ];
  getmedicinelist() async {
    var list = await FirebaseFirestore.instance.collection('medicine').get();
    var result = 
    list.docs.map((medicine) => MedicineModel.fromMap(medicine.data())).toList();
  }

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
                    'Medicine List',
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
        onPressed: () {
          for (var data in medicinelist) {
            FirebaseFirestore.instance.collection('medicine').add(data.toMap());
          }
        },
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
          itemCount: medicinelist.length,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xffF9ADB7)),
              child: Column(
                children: [
                  Text(medicinelist[index].medicine_name),
                  Text(medicinelist[index].time)
                ],
              ),
            );
          }),
    );
  }
}
