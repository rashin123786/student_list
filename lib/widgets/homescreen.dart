import 'package:flutter/material.dart';
import 'package:students_1/functions/db_function.dart';
import 'package:students_1/widgets/addstudent.dart';
import 'package:students_1/widgets/liststudent.dart';

// ignore: camel_case_types
class homescreen extends StatelessWidget {
  const homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    getallstudent();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            addstudent(),
            const Expanded(
              child: liststudent(),
            ),
          ],
        ),
      ),
    );
  }
}
