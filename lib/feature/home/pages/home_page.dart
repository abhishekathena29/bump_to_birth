import 'package:bump_to_birth/core/navigation.dart';
import 'package:bump_to_birth/feature/doctor/pages/doctor.dart';
import 'package:bump_to_birth/feature/doctor/pages/pages/medicine_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<String> homeImage = [
    "assets/medical-team.png",
    "assets/receipt.png",
    "assets/medical-report.png",
    "assets/connect&chat.png",
  ];
  final List<String> homeItemName = [
    "Doctor",
    "Medicine and Appointments",
    "Test Results",
    "Connect & Chat",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(1.sw, 0.1.sh),
        child: Container(
          color: const Color(0xffF9ADB7),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "Home",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 4,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  childAspectRatio: 0.6),
              itemBuilder: (context, index) {
                return Card(
                  color: const Color(0xffFEC9C3),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const Spacer(),
                        Image.asset(homeImage[index]),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            print(index);
                            if (index == 0)
                              moveTo(context, DoctorPage());
                            else if (index == 1)
                              moveTo(context, MedicinePage());
                          },
                          child: Card(
                            color: const Color(0xffF9ADB7),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Text(
                                  homeItemName[index],
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontSize: 18, color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
