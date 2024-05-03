import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../core/constants/variables.dart';
import '../models/responses/ujian_response_model.dart';
import 'auth_local_datasource.dart';

class UjianRemoteDataSource {
  Future<Either<String, UjianResponseModel>> getUjianByKategori(
      String kategori) async {
    final authData = await AuthLocalDatasource().getAuthData();
    final response = await http.get(
      Uri.parse('${Variables.baseUrl}/api/get-soal-ujian?kategori=$kategori'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Bearer ${authData.accessToken}'
      },
    );

    if (response.statusCode == 200) {
      return Right(UjianResponseModel.fromJson(response.body));
    } else {
      return const Left('get ujian failed');
    }
  }

  Future<Either<String, String>> createUjian() async {
    final authData = await AuthLocalDatasource().getAuthData();
    final response = await http.post(
      Uri.parse('${Variables.baseUrl}/api/create-ujian'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Bearer ${authData.accessToken}'
      },
    );

    if (response.statusCode == 200) {
      return const Right('create ujian success');
    } else {
      return const Left('get ujian failed');
    }
  }

  Future<Either<String, String>> answer(int soalId, String jawaban) async {
    final authData = await AuthLocalDatasource().getAuthData();
    final body = {
      'soal_id': soalId,
      'jawaban': jawaban,
    };
    final response = await http.post(
      Uri.parse('${Variables.baseUrl}/api/answers'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Bearer ${authData.accessToken}'
      },
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      return const Right('answer success');
    } else {
      return const Left('answer failed');
    }
  }

  Future<Either<String, String>> hitungNilai(String kategori) async {
    final authData = await AuthLocalDatasource().getAuthData();

    final response = await http.get(
      Uri.parse('${Variables.baseUrl}/api/get-nilai?kategori=$kategori'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Bearer ${authData.accessToken}'
      },
    );

    if (response.statusCode == 200) {
      return const Right('hitung nilai success');
    } else {
      return const Left('hitung nilai failed');
    }
  }
}
