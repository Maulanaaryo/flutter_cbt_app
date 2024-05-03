part of 'answer_bloc.dart';

@freezed
class AnswerState with _$AnswerState {
  const factory AnswerState.initial() = _Initial;
  const factory AnswerState.loading() = _Loading;
  const factory AnswerState.loaded() = _Loaded;
  const factory AnswerState.error(String message) = _Error;
}
