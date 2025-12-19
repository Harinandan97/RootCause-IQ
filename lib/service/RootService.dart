import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../errorModel/erorr.dart';

class RootService {
  final Dio dio = Dio()
    ..options.validateStatus = (status) => status != null && status < 500;

  Future<Either<ApiError, String>> providerService({
    required String prompt,
  }) async {
    const apiKey =
        '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';
    const url = 'https://api.openai.com/v1/chat/completions';

    dio.options.headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $apiKey",
    };

    final body = {
      "model": "gpt-3.5-turbo",
      "messages": [
        {"role": "user", "content": prompt},
      ],
    };

    try {
      final response = await dio.post(url, data: body);

      if (response.statusCode == 200) {
        final String content =
        response.data['choices'][0]['message']['content'];
        return Right(content);
      } else {
        return Left(
          ApiError(
            message:
            response.data['error']?['message'] ?? 'Request failed',
          ),
        );
      }
    } on DioException catch (e) {
      return Left(ApiError.fromDioError(e));
    }
  }
}
