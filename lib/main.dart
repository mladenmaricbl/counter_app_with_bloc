import 'package:counter_app_with_bloc/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Counter app'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocListener<CounterCubit, CounterState>(
        listener: (context, state) {
          if(state.actionType == 'increment'){
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content: Text('You incremented a value!')
                )
            );
          }
          if(state.actionType == 'decrement'){
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: Text('You decremented a value!')
                  )
             );
          }
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              BlocBuilder<CounterCubit, CounterState>(
                builder: (context, state) {
                  return Text(
                    '${state.counterValue}',
                    style: Theme
                        .of(context)
                        .textTheme
                        .headline4,
                  );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).decrement();
                    },
                    icon: Icon(Icons.exposure_minus_1),
                    label: Text(''),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).increment();
                    },
                    icon: Icon(Icons.exposure_plus_1),
                    label: Text(''),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
