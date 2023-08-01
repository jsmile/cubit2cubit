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
    return MultiBlocProvider(
      // ColorBlocProvider -> CounterBlocProvider 순서로 생성.
      providers: [
        // 사용될 Cubit 들을 생성.
        BlocProvider<ColorCubit>(
          // create: (context) => ColorCubit(),
          create: (colorContext) => ColorCubit(),
        ),
        BlocProvider<CounterCubit>(
          // create: (context) =>
          create: (counterContext) =>
              CounterCubit(colorCubit: counterContext.read<ColorCubit>()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Cubit to Cubit',
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Cubit to Cubit Home Page'),
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
      // backgroundColor: const Color.fromRGBO(233, 0, 0, 0.8),
      // backgroundColor: BlocProvider.of<ColorCubit>( context ).state.color,
      backgroundColor: context.watch<ColorCubit>().state.color,
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
              onPressed: () {
                // BlocProvider.of<ColorCubit>(context).changeColor();
                context.read<ColorCubit>().changeColor();
              },
            ),
            const SizedBox(height: 20.0),
            Text(
              // '${BlocProvider.of<CounterCubit>(context).state.counter}',
              '${context.watch<CounterCubit>().state.counter}',
              style: TextStyle(
                fontSize: 52.0,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              child: const Text('Increment Counter'),
              onPressed: () {
                // BlocProvider.of<CounterCubit>(context).changeCounter();
                context.read<CounterCubit>().changeCounter();
              },
            ),
          ],
        ),
      ),
    );
  }
}
