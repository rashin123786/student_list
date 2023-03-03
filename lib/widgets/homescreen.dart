import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:students_1/providers/db_function_provider.dart';
import 'package:students_1/widgets/addstudent.dart';
import 'package:students_1/widgets/liststudent.dart';
import 'package:students_1/widgets/search.dart';

// ignore: camel_case_types
class homescreen extends StatelessWidget {
  const homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<DbProvider>(context, listen: false).getallstudent();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Student Details'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SearchScreen(),
                ),
              );
            },
            icon: const Icon(
              Icons.search,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            AddStudent(),
            const SizedBox(
              height: 20,
            ),
            const Expanded(
              child: ListStudent(),
            ),
          ],
        ),
      ),
    );
  }
}
