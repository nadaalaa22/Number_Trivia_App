part of 'number_trivia_bloc.dart';

@immutable
abstract class NumberTriviaEvent {}
class GetNumberTrivia extends NumberTriviaEvent {
  final int number ;

  GetNumberTrivia({required this.number});
}
class GetRandomNumberTrivia extends NumberTriviaEvent {}
