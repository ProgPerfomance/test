import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<Counter, int> {
  CounterBloc() : super(0) {
    on<CounterInc>(_oninc);
    on<CounterDec>(_ondec);
  }
  _oninc(CounterInc event, Emitter<int> emit) {
    emit(state + 1);
  }
  _ondec(CounterDec event, Emitter<int> emit) {
    emit(state - 1);
  }
}

class CounterInc extends Counter {}

class CounterDec extends Counter {}

abstract class Counter {}
