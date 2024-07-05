import 'package:flutter/material.dart';

moveTo(BuildContext context, Widget page) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}

moveBack(BuildContext context) {
  Navigator.pop(context);
}
