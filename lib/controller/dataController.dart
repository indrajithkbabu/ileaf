import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:ileaf/model/dataModel.dart';
import 'package:ileaf/service/dataServices.dart';

class DataController extends GetxController {
  var DataList = [].obs;
  var searchList = [].obs;
  var loading = true.obs;

  searchUser(String query) {
    Box<List<dynamic>>? userBox;
    userBox = Hive.box<List<dynamic>>("dbBoxName");

    final List<DataModel> allDetails = userBox.get(dbkey)!.cast<DataModel>();

    // print(allDetails[2].company!.name);
    List<DataModel> result = [];
    if (query.isEmpty) {
      result = allDetails;
    } else {
      result = allDetails
          .where((user) => user.name!.toLowerCase().startsWith(query))
          .toList();
    }
    searchList.value = result;
  }

  getData() async {
    var datas = await DataServices().getMethod();
    loading.value = true;
    try {
      if (datas != null) {
        DataList.value = datas;
        loading.value = false;
      }
    } catch (e) {
      Get.snackbar("title", "$e");
      loading.value = true;
    }
  }

  @override
  void onInit() {
    getData();

    super.onInit();
  }
}
