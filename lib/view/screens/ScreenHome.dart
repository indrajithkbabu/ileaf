import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:ileaf/controller/dataController.dart';
import 'package:ileaf/model/dataModel.dart';
import 'package:ileaf/view/screens/ScreenDetails.dart';

class ScreenHome extends StatefulWidget {
  ScreenHome({Key? key}) : super(key: key);

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  final controller = Get.put(DataController());
  Box<List<dynamic>>? userBox;
  TextEditingController? _textEditingController = TextEditingController();
  // List<DataModel>searchList =[];
  @override
  void initState() {
    userBox = Hive.box<List<dynamic>>("dbBoxName");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    controller.searchList.value = controller.DataList.cast<DataModel>();
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: TextField(
                  controller: _textEditingController,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: "search user",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide())),
                  onChanged: (value) {
                    controller.searchUser(value);
                  },
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              flex: 12,
              child: Container(
                  child: Obx(
                () => controller.loading.isTrue
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        itemCount: controller.searchList.length,
                        itemBuilder: (context, index) {
                          var data = controller.searchList[index];

                          return InkWell(
                            onTap: () => Get.to(ScreenDetails(
                              data: data,
                            )),
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ListTile(
                                  title: Text("${data.name}"),
                                  subtitle: data.company != null
                                      ? Text("${data.company!.name}")
                                      : Text("No data available"),
                                  leading: CircleAvatar(
                                      radius: 25,
                                      child: ClipOval(
                                        child: Image.network(
                                          "${data.profileImage}",
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                            return Container(
                                              width: 130,
                                              child: Image.asset(
                                                "assets/images/noImage.jpg",
                                              ),
                                            );
                                          },
                                        ),
                                      )),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
              )),
            )
          ],
        ));
  }
}
