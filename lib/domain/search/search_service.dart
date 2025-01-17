import 'package:dartz/dartz.dart';
import 'package:netflix/domain/downloads/core/failures/main_failure.dart';
import 'package:netflix/domain/search/modle/search_resp/search_resp/search_resp.dart';

abstract class SearchService {
  Future<Either<MainFailure, SearchResp>> searchMovies({
    required String movieQuery,
  });
}
