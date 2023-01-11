import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:ileaf/model/dataModel.dart';
import 'package:http/http.dart' as http;
import 'package:ileaf/view/screens/ScreenHome.dart';

int dbkey = 0;

class DataServices {
  var url = "https://run.mocky.io/v3/3440c30c-8872-4d73-bef5-1a5d33e2ad87";
  Future<List<DataModel>?> getMethod() async {
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var body = await json.decode(response.body);
      Box<List<dynamic>>? userBox;
      userBox = Hive.box<List<dynamic>>("dbBoxName");
      await userBox.put(
          dbkey, List<dynamic>.from(body.map((x) => DataModel.fromJson(x))));

      // var getDetails=List<DataModel>.from(body.map((x) => DataModel.fromJson(x)));
      // print(getDetails.elementAt(0).name);
      List<DataModel> datareq = userBox.get(dbkey)!.cast<DataModel>();
      //  print(datareq[0].name);

      return datareq;
      // List<DataModel>.from(body.map((x) => DataModel.fromJson(x)));
    } else {
      return null;
    }
  }
}
