import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_cbt_app/data/datasources/materi_remote_datasource.dart';

import '../../../../data/models/responses/materi_response_model.dart';

part 'materi_bloc.freezed.dart';
part 'materi_event.dart';
part 'materi_state.dart';

class MateriBloc extends Bloc<MateriEvent, MateriState> {
  final MateriRemoteDataSource materiRemoteDataSource;
  MateriBloc(
    this.materiRemoteDataSource,
  ) : super(const _Initial()) {
    on<MateriEvent>((event, emit) async {
      emit(const _Loading());
      final response = await materiRemoteDataSource.getAllMateri();
      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r)),
      );
    });
  }
}
