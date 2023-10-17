import 'dart:convert';
import 'dart:io';

import 'package:number_trivia_app/data/models/number_trivia_model.dart';
import 'package:http/http.dart' ;

abstract class NumberTriviaRemoteDS {
  ///  calls the [NumberTriviaAPI] return an instant of NumberTriviaModel
  ///
  /// throw an error
  Future<NumberTriviaEntity> getNumberTrivia(int number);
  ///  calls the [NumberTriviaAPI]  return an instant of NumberTriviaModel
  ///
  /// throw an error
  Future<NumberTriviaEntity> getNumberTriviaForRandom();
}
class NumberTriviaImp implements NumberTriviaRemoteDS{
  @override
  Future<NumberTriviaEntity> getNumberTrivia(int number) async {
    var url = Uri.parse('http://numbersapi.com/$number') ;
    var response = await get(url,
        headers: {HttpHeaders.contentTypeHeader : 'application/json'}) ;
    if(response.statusCode>199 && response.statusCode<300)
      {

        return  NumberTriviaModel.fromMap(jsonDecode(response.body));
      }
    else
      {
        print('error with status : ${response.statusCode}') ;
        throw Exception('api failed');
      }

  }

  @override
  Future<NumberTriviaEntity> getNumberTriviaForRandom() async {
    var url = Uri.parse('http://numbersapi.com/random') ;
    var response = await get(url,
        headers: {HttpHeaders.contentTypeHeader : 'application/json'}) ;
    if(response.statusCode>199 && response.statusCode<300)
    {
      return  NumberTriviaModel.fromMap(jsonDecode(response.body));
    }
    else
    {
      print('error with status : ${response.statusCode}') ;
      throw Exception('api failed');
    }


  }

}