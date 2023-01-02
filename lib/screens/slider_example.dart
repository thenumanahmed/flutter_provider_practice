import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/sliderProvider.dart';

class SliderExample extends StatefulWidget {
  const SliderExample({super.key});

  @override
  State<SliderExample> createState() => _SliderExampleState();
}

class _SliderExampleState extends State<SliderExample> {
  @override
  Widget build(BuildContext context) {
    print('rebuild');

    // to access the provider
    // listen: true => rebuild whole widget on change
    final provider = Provider.of<SliderExampleProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter Example"),
      ),
      body: Column(
        children: [
          Consumer<SliderExampleProvider>(builder: (context, value, child) {
            return Slider(
              min: 0,
              max: 1,
              value: provider.value,
              onChanged: (val) {
                provider.updateValue(val);
              },
            );
          }),
          Consumer<SliderExampleProvider>(builder: (context, value, child) {
            return Row(
              children: [
                Expanded(
                    child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                      color: Colors.red.withOpacity(provider.value)),
                  child: const Center(child: Text("Container 1")),
                )),
                Expanded(
                    child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(provider.value)),
                  child: const Center(child: Text("Container 2")),
                )),
              ],
            );
          }),
        ],
      ),
    );
  }
}
