import 'package:counter_app_with_bloc/app_ui/routing/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:counter_app_with_bloc/cubit/counter_cubit.dart';

class HomeScreen extends StatelessWidget {
  String title;
  Color color;

  HomeScreen({required this.title, required this.color});

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
            SizedBox(
              height: 50,
            ),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.secondScreen);
              },
              icon: Icon(Icons.arrow_forward_rounded),
              label: Text('Go to second screen'),
            ),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.thirdScreen);
              },
              icon: Icon(Icons.arrow_forward_rounded),
              label: Text('Go to third screen'),
            )
          ],
        ),
      ),
    );
  }
}
