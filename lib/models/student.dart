import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/foundation.dart';

enum gender { M, F }

class Student {
  DateTime dateOfBirth;
  final String name;
  final String institute;
  String course;
  String group;
  final String fatherName;
  final String motherName;
  int mobileNo;
  String address;
  CountryCode nationality;
  String instituteId;
  gender gen;
  Student(
      {@required this.gen,
      @required this.dateOfBirth,
      @required this.name,
      @required this.address,
      @required this.course,
      @required this.fatherName,
      @required this.group,
      @required this.institute,
      @required this.mobileNo,
      @required this.motherName,
      @required this.nationality,
      @required this.instituteId});
}
