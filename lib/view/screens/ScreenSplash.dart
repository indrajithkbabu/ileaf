import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:ileaf/controller/dataController.dart';
import 'package:ileaf/service/dataServices.dart';
import 'package:ileaf/view/screens/ScreenHome.dart';

import '../../model/dataModel.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({Key? key}) : super(key: key);

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState() {
    Timer(Duration(seconds: 2), () {
      loadData();
    });
    super.initState();
  }

  Future loadData() async {
    Box<List<dynamic>>? userBox;
    userBox = Hive.box<List<dynamic>>("dbBoxName");
    if (userBox.containsKey(dbkey)) {
      print(" db value");

      DataController().DataList.value = userBox.get(dbkey)!;
      userBox.get(dbkey);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => ScreenHome()));
      Get.snackbar("title", "db data");
    } else {
      print(" api value");
      await DataServices().getMethod();
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => ScreenHome()));
      Get.snackbar("title", "Api data");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(child: Image.asset("assets/images/splash.png")),
      ),
    );
  }
}
