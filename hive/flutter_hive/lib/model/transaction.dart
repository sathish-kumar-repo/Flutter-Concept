//1. modify your model class

import 'package:hive/hive.dart';

part 'transaction.g.dart';
// g => generator, this is model class adaptor which we want to generate

// Annot yur model class with a hive type

@HiveType(typeId: 0)
// type id needs to be unique number all of your model classes
// Optional for extends hiveObject
class Transaction extends HiveObject {
  // annotate all fields within your model class that you want persist in your hive database
  @HiveField(0)
  late String name;

  @HiveField(1)
  late DateTime createdDate;

  @HiveField(2)
  late bool isExpense = true;

  @HiveField(3)
  late double amount;
}

// @HiveType(typeId: 1)
// class User {
//   late String name;

//   late DateTime createdDate;

//   late bool isExpense = true;

//   late double amount;
// }


// 2. paste in your prompt 'flutter packages pub run build_runner build'