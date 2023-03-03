// ignore_for_file: camel_case_types, duplicate_ignore

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:students_1/functions/db_function.dart';
import 'package:students_1/providers/db_function_provider.dart';
import 'package:students_1/widgets/studentdetails.dart';
import 'package:image_picker/image_picker.dart';

class liststudent extends StatefulWidget {
  liststudent({super.key});

  @override
  State<liststudent> createState() => _liststudentState();
}

class _liststudentState extends State<liststudent> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DbProvider>(
      builder: (context, value, child) {
        return ListView.separated(
            itemBuilder: (ctx, index) {
              final data = value.studentlistnoti[index];
              return ListTile(
                title: Text(
                  data.names,
                  style: const TextStyle(fontSize: 21),
                ),
                leading: CircleAvatar(
                  backgroundColor: Colors.accents[index],
                ),
                trailing: IconButton(
                    onPressed: () {
                      Provider.of<DbProvider>(context, listen: false)
                          .deletestudent(index);
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    )),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: ((context) {
                        return studentdetails(datas: data);
                      }),
                    ),
                  );
                },
              );
            },
            separatorBuilder: (ctx, index) {
              return const Divider(
                thickness: 5,
              );
            },
            itemCount: value.studentlistnoti.length);
      },
    );
  }
}
