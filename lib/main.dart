import 'package:blocguide/conter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CounterBloc(), child: HomePage()),
      ],
      child: MaterialApp(
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<CounterBloc, int>(builder: (context, count) {
          return Text('$count');
        }),
      ),
      floatingActionButton: Column(
        children: [
          TextButton(
              onPressed: () {
                context.read<CounterBloc>().add(CounterInc());
              },
              child: Text('+')),
          TextButton(
              onPressed: () {
                context.read<CounterBloc>().add(CounterDec());
              },
              child: Text('-')),
        ],
      ),
    );
  }
}
