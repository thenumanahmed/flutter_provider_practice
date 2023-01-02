import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_practice/Provider/count_provider.dart';

class CounterExample extends StatefulWidget {
  const CounterExample({super.key});

  @override
  State<CounterExample> createState() => _CounterExampleState();
}

class _CounterExampleState extends State<CounterExample> {
  @override
  Widget build(BuildContext context) {
    print('rebuild');
    // return Container();

    // to access the provider
    // listen: true => rebuild whole widget on change
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter Example"),
      ),
      body: Center(
        // < > contains the context
        child: Consumer<CountProvider>(builder: (context, value, child) {
          return Text(
            value.count.toString(),
            style: const TextStyle(fontSize: 30),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          countProvider.incrementCount();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}