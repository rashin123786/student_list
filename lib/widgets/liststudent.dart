// ignore_for_file: camel_case_types, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:students_1/functions/db_function.dart';
import 'package:students_1/widgets/studentdetails.dart';

class liststudent extends StatelessWidget {
  const liststudent({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: studentlistnoti,
      // ignore: non_constant_identifier_names
      builder: (Context, value, child) {
        return ListView.separated(
            itemBuilder: (ctx, index) {
              final data = value[index];
              return ListTile(
                title: Text(
                  data.names,
                  style: const TextStyle(fontSize: 21),
                ),
                leading: Image.network(
                    'https://as2.ftcdn.net/v2/jpg/04/46/00/53/1000_F_446005319_fz8e6xTxcgRaS51EL0a9HsjsQBvCdyq3.jpg'),
                trailing: IconButton(
                    onPressed: () {
                      deletestudent(index);
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
            itemCount: value.length);
      },
    );
  }
}
