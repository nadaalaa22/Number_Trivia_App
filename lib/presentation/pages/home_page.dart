import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:number_trivia_app/presentation/bloc/number_trivia_bloc.dart';
import 'package:number_trivia_app/presentation/pages/result_page.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  var name = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(
          'Number trivia',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
      body: BlocBuilder<NumberTriviaBloc, NumberTriviaState>(
        builder: (context, state) {
          print(state);
          return Padding(
            padding: EdgeInsets.all(16),
            child: Container(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Start Searching . . .',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),


                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: TextFormField(
                            controller: name,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: 'Enter a Number',
                              border: OutlineInputBorder(),
                            ),
                            validator: (text) {
                              if (text!.isEmpty) {
                                return 'Field cannot be empty';
                              }
                              if (int.tryParse(text) == null) {
                                return 'Please enter a valid number';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () async {
                                if (formKey.currentState!.validate()) {
                                  context.read<NumberTriviaBloc>().add(
                                      GetNumberTrivia(
                                          number: int.parse(name.text)));
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> ResultPage())) ;
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      8),
                                ),
                              ),
                              child: const Text('Search'),
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                context.read<NumberTriviaBloc>().add(
                                    GetRandomNumberTrivia());
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> ResultPage())) ;
                              },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  // Adjust the border radius as needed
                                ),
                              ),
                              child: const Text('Random'),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
