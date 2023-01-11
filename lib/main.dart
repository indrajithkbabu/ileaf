import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ileaf/model/dataModel.dart';
import 'package:ileaf/view/screens/ScreenHome.dart';
import 'package:ileaf/view/screens/ScreenSplash.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final document = await getApplicationDocumentsDirectory();
  Hive.init(document.path);
  await Hive.initFlutter();
  Hive
    ..registerAdapter(DataModelAdapter())
    ..registerAdapter(AddressAdapter())
    ..registerAdapter(CompanyAdapter());

  await Hive.openBox<List<dynamic>>("dbBoxName");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ScreenSplash(),
    );
  }
}
