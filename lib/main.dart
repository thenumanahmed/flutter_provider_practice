import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_practice/screens/slider_example.dart';

import 'Provider/count_provider.dart';
import 'provider/sliderProvider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        //now it has the global context
        providers: [
          ChangeNotifierProvider(create: (_) => SliderExampleProvider()),
          ChangeNotifierProvider(create: (_) => CountProvider())
        ],
        // create: (_) => CountProvider(),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const SliderExample(),
        ));
  }
}
