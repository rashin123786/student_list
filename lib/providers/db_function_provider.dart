import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import 'package:students_1/widgets/search.dart';
import '../db/model/models.dart';

class DbProvider with ChangeNotifier {
  String notfound = 'Nothing Found';
  List<studentmodel> studentlistnoti = [];

  List<studentmodel> foundetails = [];

  List<studentmodel> result = [];

  void SearchResult(String searchtext) {
    ist = false;

    result = studentlistnoti
        .where((element) =>
            element.names.toLowerCase().contains(searchtext.toLowerCase()))
        .toList();

    foundetails = result;
    notifyListeners();
  }

  void addstudentlist(studentmodel value) async {
    final dbstudent = await Hive.openBox<studentmodel>('student_db');
    final id = await dbstudent.add(value);
    value.id = id;
    studentlistnoti.add(value);
    notifyListeners();
  }

  void getallstudent() async {
    final dbstudent = await Hive.openBox<studentmodel>('student_db');
    studentlistnoti.clear();
    studentlistnoti.addAll(dbstudent.values);
    notifyListeners();
  }

  deletestudent(int id) async {
    final dbstudent = await Hive.openBox<studentmodel>('student_db');
    await dbstudent.deleteAt(id);
    notifyListeners();
    getallstudent();
  }

  Future<void> updatedetails(studentmodel value) async {
    final dbstudent = await Hive.openBox<studentmodel>('student_db');
    await dbstudent.put(value.id, value);
    getallstudent();
    notifyListeners();
  }
}
