part of 'register_bloc.dart';

@freezed
class RegisterState with _$RegisterState {
  const factory RegisterState.initial() = _Initial;
  const factory RegisterState.loaded(AuthResponseModel authResponseModel) = _Loaded;
  const factory RegisterState.loading() = _Loading;
  const factory RegisterState.error(String message) = _Error;
}
