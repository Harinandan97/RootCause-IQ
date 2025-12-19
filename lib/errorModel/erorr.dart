import 'package:dio/dio.dart';

class ApiError {
  final String message;

  ApiError({required this.message});

  factory ApiError.fromDioError(DioException e) {
    String errorMessage = "Something went wrong";

    if (e.response?.data is Map<String, dynamic>) {
      final data = e.response!.data;

      // OpenAI-style error
      if (data['error'] != null && data['error']['message'] != null) {
        errorMessage = data['error']['message'];
      }
    } else if (e.message != null) {
      errorMessage = e.message!;
    }

    return ApiError(message: errorMessage);
  }
}
