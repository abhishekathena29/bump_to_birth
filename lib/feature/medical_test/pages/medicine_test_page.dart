import 'package:bump_to_birth/core/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MedicineTestPage extends StatelessWidget {
  const MedicineTestPage({super.key});

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
                    'Medicine Test Page',
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
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            MedicalTestWidget(
              title: 'Blood Pressure Level',
              onpress: () {},
            ),
            MedicalTestWidget(
              title: 'Blood Oxygen Level',
              onpress: () {},
            ),
            MedicalTestWidget(
              title: 'Fasting Blood Sugar Level',
              onpress: () {},
            ),
            MedicalTestWidget(
              title: 'After Meal Blood Sugar Level',
              onpress: () {},
            ),
            MedicalTestWidget(
              title: 'HBA1C Level',
              onpress: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class MedicalTestWidget extends StatelessWidget {
  const MedicalTestWidget({
    super.key,
    required this.title,
    this.onpress,
  });

  final String title;
  final Function()? onpress;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 15),
                    child: Column(
                      children: [
                        Text(
                          title,
                        ),
                        TextField(
                          decoration: InputDecoration(),
                        ),
                        const SizedBox(height: 30),
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text(
                            'Check',
                            style: TextStyle(),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff4B39EF)),
              child: const Text(
                'Check',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
