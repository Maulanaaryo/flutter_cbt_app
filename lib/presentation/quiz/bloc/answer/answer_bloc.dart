import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_cbt_app/data/datasources/ujian_remote_datasource.dart';

part 'answer_bloc.freezed.dart';
part 'answer_event.dart';
part 'answer_state.dart';

class AnswerBloc extends Bloc<AnswerEvent, AnswerState> {
  final UjianRemoteDataSource ujianRemoteDataSource;
  AnswerBloc(
    this.ujianRemoteDataSource,
  ) : super(const _Initial()) {
    on<_SetAnswer>((event, emit) async {
      emit(const _Loading());
      final response =
          await ujianRemoteDataSource.answer(event.soalId, event.jawaban);
      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(const _Loaded()),
      );
    });
  }
}
