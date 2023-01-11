
import 'package:hive/hive.dart';
part 'dataModel.g.dart';


@HiveType(typeId: 0)
class DataModel extends HiveObject{
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  String? username;
  @HiveField(3)
  String? email;
  @HiveField(4)
  String? profileImage;
  @HiveField(5)
  Address? address;
  @HiveField(6)
  String? phone;
  @HiveField(7)
  String? website;
  @HiveField(8)
  Company? company;

  DataModel(
      {this.id,
      this.name,
      this.username,
      this.email,
      this.profileImage,
      this.address,
      this.phone,
      this.website,
      this.company});

  DataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    email = json['email'];
    profileImage = json['profile_image'];
    address =
        json['address'] != null ? new Address.fromJson(json['address']) : null;
    phone =   json['phone'] != null ? json['phone'] : null;
    website = json['website'];
    company =
        json['company'] != null ? new Company.fromJson(json['company']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['username'] = this.username;
    data['email'] = this.email;
    data['profile_image'] = this.profileImage;
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    data['phone'] = this.phone;
    data['website'] = this.website;
    if (this.company != null) {
      data['company'] = this.company!.toJson();
    }
    return data;
  }
}
@HiveType(typeId: 1)
class Address extends HiveObject {
   @HiveField(0)
  String? street;
   @HiveField(1)
  String? suite;
   @HiveField(2)
  String? city;
   @HiveField(3)
  String? zipcode;


  Address({this.street, this.suite, this.city, this.zipcode});

  Address.fromJson(Map<String, dynamic> json) {
    street = json['street'];
    suite = json['suite'];
    city = json['city'];
    zipcode = json['zipcode'];
 
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['street'] = this.street;
    data['suite'] = this.suite;
    data['city'] = this.city;
    data['zipcode'] = this.zipcode;
   
    return data;
  }
}


@HiveType(typeId: 2)
class Company extends HiveObject{
   @HiveField(0)
  String? name;
   @HiveField(1)
  String? catchPhrase;
   @HiveField(2)
  String? bs;

  Company({this.name, this.catchPhrase, this.bs});

  Company.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    catchPhrase = json['catchPhrase'];
    bs = json['bs'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['catchPhrase'] = this.catchPhrase;
    data['bs'] = this.bs;
    return data;
  }
}