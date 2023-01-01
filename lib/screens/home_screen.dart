import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_practice/Provider/count_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // to access the provider
    final countProvider = Provider.of<CountProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter Example"),
      ),
      body: Center(
        child: Text(
          countProvider.count.toString(),
          style: const TextStyle(fontSize: 30),
        ),
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
