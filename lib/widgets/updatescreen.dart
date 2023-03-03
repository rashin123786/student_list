// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:students_1/db/model/models.dart';
import '../providers/db_function_provider.dart';

// ignore: camel_case_types
class updatescreen extends StatelessWidget {
  final studentmodel updatestudentmodel;
  const updatescreen({super.key, required this.updatestudentmodel});

  @override
  Widget build(BuildContext context) {
    final name_control = TextEditingController(text: updatestudentmodel.names);

    final age_control = TextEditingController(text: updatestudentmodel.ages);

    final course_control =
        TextEditingController(text: updatestudentmodel.courses);

    final mark_control = TextEditingController(text: updatestudentmodel.marks);
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('Update'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Center(
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
                  TextFormField(
                    keyboardType: TextInputType.number,
                    validator: (value) =>
                        value!.isEmpty ? 'name cannot be blank' : null,
                    controller: age_control,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), hintText: 'Age'),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    validator: (value) =>
                        value!.isEmpty ? 'name cannot be blank' : null,
                    controller: course_control,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), hintText: 'Course'),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    validator: (value) =>
                        value!.isEmpty ? 'name cannot be blank' : null,
                    controller: mark_control,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), hintText: 'Mark'),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      formKey.currentState!.validate();
                      studentmodel newdata = studentmodel(
                          names: name_control.text,
                          ages: age_control.text,
                          courses: course_control.text,
                          marks: mark_control.text,
                          id: updatestudentmodel.id);
                      Provider.of<DbProvider>(context, listen: false)
                          .updatedetails(newdata);
                      Navigator.pop(
                        context,
                      );
                      Navigator.pop(
                        context,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple),
                    icon: const Icon(Icons.update),
                    label: const Text(
                      'UPDATE',
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
