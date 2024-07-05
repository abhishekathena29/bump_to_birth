import 'package:bump_to_birth/core/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddMedicinePage extends StatefulWidget {
  AddMedicinePage({super.key});

  @override
  State<AddMedicinePage> createState() => _AddMedicinePageState();
}

class _AddMedicinePageState extends State<AddMedicinePage> {
  final tabletNameController = TextEditingController();

  final itemList = ['Morning', 'Afternoon', 'Night'];

  String? itemValue;

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
                    'Add Medicines',
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Tablet Name",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            TextField(
              controller: tabletNameController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Table Name...'),
            ),
            const SizedBox(height: 30),
            const Text(
              "Morning/AfterNoon/Night",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            DropdownButtonFormField(
              value: itemValue,
              hint: const Text('Select your schedule'),
              decoration: const InputDecoration(border: OutlineInputBorder()),
              items: itemList.map((e) {
                return DropdownMenuItem(
                  value: e,
                  child: Text(e),
                );
              }).toList(),
              onChanged: (val) {
                setState(() {
                  itemValue = val!;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
