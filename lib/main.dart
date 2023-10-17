import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:number_trivia_app/data/datasource/remote_ds.dart';
import 'package:number_trivia_app/presentation/bloc/number_trivia_bloc.dart';
import 'package:number_trivia_app/presentation/pages/home_page.dart';

void main() {
  runApp(BlocProvider(
    create:(_)=> NumberTriviaBloc(NumberTriviaImp()),
      child:  MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  HomePage(),
    );
  }
}

