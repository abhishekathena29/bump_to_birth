import 'package:bump_to_birth/feature/auth/pages/login_page.dart';
import 'package:bump_to_birth/feature/forum/pages/forum_page.dart';
import 'package:bump_to_birth/feature/home/pages/home_page.dart';
import 'package:bump_to_birth/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: ScreenUtil.defaultSize,
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            title: 'Bump To Birth',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: HomePage(),
          );
        });
  }
}

class PofilePage extends StatelessWidget {
  const PofilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("Hello this is Adithi"),
          Row(
            children: [
              Container(),
              Container(),
            ],
          ),
          Container(
            child: Column(
              children: [
                Text("This is Abhishek"),
                Row(
                  children: [],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
