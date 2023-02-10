// ignore_for_file: camel_case_types

import 'package:hive/hive.dart';

part 'models.g.dart';

@HiveType(typeId: 1)
class studentmodel {
  @HiveField(0)
  int? id;

  @HiveField(1)
  final String names;
  @HiveField(2)
  final String ages;
  @HiveField(3)
  final String courses;
  @HiveField(4)
  final String marks;
  studentmodel(
      {required this.names,
      required this.ages,
      required this.courses,
      required this.marks,
      this.id});
}
