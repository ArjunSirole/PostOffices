// ignore_for_file: depend_on_referenced_packages

import 'package:retrofit/retrofit.dart';
import 'json.dart';
import 'package:dio/dio.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: "https://api.postalpincode.in/")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/pincode/{PINCODE}")
  Future<List<Pincode>> getPincode(@Path("PINCODE") String pincode);
}
