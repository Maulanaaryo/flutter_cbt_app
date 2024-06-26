part of 'hitung_nilai_bloc.dart';

@freezed
class HitungNilaiState with _$HitungNilaiState {
  const factory HitungNilaiState.initial() = _Initial;
  const factory HitungNilaiState.loading() = _Loading;
  const factory HitungNilaiState.loaded(int nilai) = _Loaded;
  const factory HitungNilaiState.error(String message) = _Error;
}
