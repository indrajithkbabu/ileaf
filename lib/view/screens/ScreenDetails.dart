import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ileaf/model/dataModel.dart';

class ScreenDetails extends StatelessWidget {
  ScreenDetails({Key? key, required this.data}) : super(key: key);
  DataModel data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                  height: 250,
                  width: 250,
                  child: data.profileImage != null
                      ? Image.network(
                          data.profileImage!,
                          fit: BoxFit.contain,
                        )
                      : Image.asset(
                          "assets/images/noImage.jpg",
                        )),
              Container(
                height: 250,
                width: 250,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      "Name : ${data.name}",
                      style: TextStyle(
                        fontSize: 19,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Username : ${data.username}",
                      style: TextStyle(
                        fontSize: 19,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Email : ${data.email}",
                      style: TextStyle(
                        fontSize: 19,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    data.phone != null
                        ? Text(
                            "Phone : ${data.phone}",
                            style: TextStyle(
                              fontSize: 19,
                            ),
                          )
                        : SizedBox(),
                    SizedBox(
                      height: 15,
                    ),
                    data.company != null
                        ? Text(
                            "Company name : ${data.company!.name}",
                            style: TextStyle(
                              fontSize: 19,
                            ),
                          )
                        : SizedBox(),
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
