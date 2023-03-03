import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:students_1/db/model/models.dart';

import 'package:students_1/providers/db_function_provider.dart';

// ignore: must_be_immutable
class AddStudent extends StatelessWidget {
  AddStudent({super.key});

  var nameControl = TextEditingController();
  final ageControl = TextEditingController();
  final courseControl = TextEditingController();
  final markControl = TextEditingController();
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
              controller: nameControl,
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
              controller: ageControl,
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
              controller: courseControl,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Course'),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              validator: (value) =>
                  value!.isEmpty ? 'mark cannot be blank' : null,
              controller: markControl,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Mark'),
            ),
            const SizedBox(
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
                label: const Text('Add'))
          ],
        ),
      ),
    );
  }

  addbuttonclick(context) async {
    final name = nameControl.text;
    final age = ageControl.text;
    final course = courseControl.text;
    final mark = markControl.text;
    if (name.isEmpty || age.isEmpty || course.isEmpty || mark.isEmpty) {
      return;
    }

    final res =
        studentmodel(names: name, ages: age, courses: course, marks: mark);
    Provider.of<DbProvider>(context, listen: false).addstudentlist(res);
  }

  void clear() {
    nameControl.clear();
    ageControl.clear();
    courseControl.clear();
    markControl.clear();
  }
}
