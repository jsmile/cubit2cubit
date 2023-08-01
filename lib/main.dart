import 'package:cubit2cubit/cubits/counter/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubits/color/color_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ColorCubit>(
      create: (context) => ColorCubit(),
      child: BlocProvider<CounterCubit>(
        create: (context) =>
            CounterCubit(colorCubit: context.read<ColorCubit>()),
        child: MaterialApp(
          title: 'Flutter Cubit to Cubit',
          theme: ThemeData(
            useMaterial3: true,
          ),
          home: const MyHomePage(title: 'Cubit to Cubit Home Page'),
        ),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(233, 0, 0, 0.8),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: const Text(
                'Change Color',
                style: TextStyle(fontSize: 24.0),
              ),
              onPressed: () {},
            ),
            const SizedBox(height: 20.0),
            const Text(
              '0',
              style: TextStyle(fontSize: 52.0, color: Colors.white),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              child: const Text('Increment Counter'),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
