
import 'package:flutter/material.dart';
import 'package:counter_7/drawer.dart';
import 'package:counter_7/models/budget.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Result'),
        ),
        // Menambahkan drawer menu
        drawer: MyDrawer(),
        body: ListView.builder(
          // Provide a builder function. This is where the magic happens.
          // Convert each item into a widget based on the type of item it is
          itemCount: Budget.listBudget.length,
          itemBuilder: (context, index) {
            Budget budget = Budget.listBudget[index];

            return ListTile(
              title: Text(budget.judul),
              subtitle: Text(budget.nominal.toString()),
              trailing: Text(budget.jenis.toString()),
            );
          },
        ));
  }
}