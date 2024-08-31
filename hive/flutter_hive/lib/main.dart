import 'package:flutter/material.dart';
import 'package:flutter_hive/model/transaction.dart';
import 'package:flutter_hive/page/transaction_page.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Step - 1
  await Hive.initFlutter('hive_db');

  Hive.registerAdapter(TransactionAdapter());

  await Hive.openBox<Transaction>('transactions');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const String title = 'Hive Expense App';
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: const TransactionPage(),
    );
  }
}
