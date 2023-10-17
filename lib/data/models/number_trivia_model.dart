class NumberTriviaEntity {
  final String text ;
  final int number ;

  NumberTriviaEntity({required this.text, required this.number});



}
class NumberTriviaModel extends NumberTriviaEntity{

  NumberTriviaModel({required super.text, required super.number});
  factory NumberTriviaModel.fromMap(Map map) => NumberTriviaModel(
    text: map['text'],
    number: map['number'],

  );

}