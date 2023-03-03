import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:students_1/providers/db_function_provider.dart';
import 'package:students_1/widgets/studentdetails.dart';

class ListStudent extends StatelessWidget {
  const ListStudent({super.key});

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
                        return StudentDetails(datas: data);
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
