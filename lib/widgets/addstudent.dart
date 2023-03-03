// ignore_for_file: non_constant_identifier_names, duplicate_ignore, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:students_1/db/model/models.dart';
import 'package:students_1/functions/db_function.dart';
import 'package:students_1/providers/db_function_provider.dart';

class AddStudent extends StatelessWidget {
  AddStudent({super.key});

  var name_control = TextEditingController();
  final age_control = TextEditingController();
  final course_control = TextEditingController();
  final mark_control = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            TextFormField(
              keyboardType: TextInputType.text,
              validator: (value) =>
                  value!.isEmpty ? 'name cannot be blank' : null,
              controller: name_control,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Name'),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              validator: (value) =>
                  value!.isEmpty ? 'age cannot be blank' : null,
              controller: age_control,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Age'),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              validator: (value) =>
                  value!.isEmpty ? 'course cannot be blank' : null,
              controller: course_control,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Course'),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              validator: (value) =>
                  value!.isEmpty ? 'mark cannot be blank' : null,
              controller: mark_control,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Mark'),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton.icon(
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  formKey.currentState!.validate();
                  addbuttonclick(context);
                  clear();
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple),
                icon: const Icon(Icons.add),
                label: Text('Add'))
          ],
        ),
      ),
    );
  }

  addbuttonclick(context) async {
    final name = name_control.text;
    final age = age_control.text;
    final course = course_control.text;
    final mark = mark_control.text;
    if (name.isEmpty || age.isEmpty || course.isEmpty || mark.isEmpty) {
      return;
    }

    final res =
        studentmodel(names: name, ages: age, courses: course, marks: mark);
    Provider.of<DbProvider>(context, listen: false).addstudentlist(res);
  }

  void clear() {
    name_control.clear();
    age_control.clear();
    course_control.clear();
    mark_control.clear();
  }
}
