// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import '../db/model/models.dart';

ValueNotifier<List<studentmodel>> studentlistnoti = ValueNotifier([]);

void addstudentlist(studentmodel value) async {
  final dbstudent = await Hive.openBox<studentmodel>('student_db');
  final id = await dbstudent.add(value);
  value.id = id;

  studentlistnoti.value.add(value);
  studentlistnoti.notifyListeners();
}

void getallstudent() async {
  final dbstudent = await Hive.openBox<studentmodel>('student_db');
  studentlistnoti.value.clear();
  studentlistnoti.value.addAll(dbstudent.values);
  studentlistnoti.notifyListeners();
}

deletestudent(int id) async {
  final dbstudent = await Hive.openBox<studentmodel>('student_db');
  await dbstudent.deleteAt(id);
  getallstudent();
}

Future<void> updatedetails(studentmodel value) async {
  final dbstudent = await Hive.openBox<studentmodel>('student_db');
  await dbstudent.put(value.id, value);
  getallstudent();
}
