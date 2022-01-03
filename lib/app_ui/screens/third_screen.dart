import 'package:counter_app_with_bloc/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThirdScreen extends StatelessWidget {
  String title;
  Color color;

  ThirdScreen({
    required this.title,
    required this.color,
    });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: color,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocConsumer<CounterCubit, CounterState>(
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
            ),
          ],
        ),
      ),
    );
  }
}
