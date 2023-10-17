import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../bloc/number_trivia_bloc.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text(
          'Number Trivia Result',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
      body: BlocConsumer<NumberTriviaBloc, NumberTriviaState>(
         listener: (context , state ){
           if (state is LoadedState) {
               Fluttertoast.showToast(
                 msg: "successfully",
                 toastLength: Toast.LENGTH_SHORT,
                 // Duration of the toast (short or long)
                 gravity: ToastGravity.BOTTOM,
                 // Position of the toast on the screen
                 timeInSecForIosWeb: 1,
                 // Time in seconds for iOS and web
                 backgroundColor: Colors.black54,
                 // Background color of the toast
                 textColor: Colors.white,
                 // Text color of the toast message
                 fontSize: 16.0, // Font size of the toast message
               );
             }
         },
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if(state is LoadingState) const CircularProgressIndicator(),
                    if(state is LoadedState) Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Text(
                              state.numberTriviaModel.number.toString(),
                              style: const TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(state.numberTriviaModel.text.toString(),
                                style: const TextStyle(fontSize: 24)),
                          ],
                        ),
                      ),
                    if (state is ErrorState)
                      Text(
                        "Error: $state",
                        style: const TextStyle(
                          fontSize: 24,
                          color: Colors.red,
                        ),
                      ),
                  ],
                ),
              ),
            );
          }
      ),
    );
  }
}

