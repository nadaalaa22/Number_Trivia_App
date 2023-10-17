import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:number_trivia_app/data/models/number_trivia_model.dart';

import '../../data/datasource/remote_ds.dart';

part 'number_trivia_event.dart';

part 'number_trivia_state.dart';

class NumberTriviaBloc extends Bloc<NumberTriviaEvent, NumberTriviaState> {
  final NumberTriviaRemoteDS numberTriviaImp ;
  NumberTriviaBloc(this.numberTriviaImp) : super(NumberTriviaInitial()) {
    on<NumberTriviaEvent>((event, emit) async {
     try {
        if (event is GetRandomNumberTrivia) {
          print('random');
          emit(LoadingState());
          NumberTriviaEntity nt =
              await NumberTriviaImp().getNumberTriviaForRandom();
          emit(LoadedState(numberTriviaModel: nt));
        }
        else if (event is GetNumberTrivia) {
          print('get number trivia');
          emit(LoadingState());
          NumberTriviaEntity nt =
              await NumberTriviaImp().getNumberTrivia(event.number);
          emit(LoadedState(numberTriviaModel: nt));
        }
      }
      catch(e){
       emit(ErrorState());
      }
    });
  }
}
