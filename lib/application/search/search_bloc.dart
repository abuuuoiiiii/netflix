import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/downloads/core/failures/main_failure.dart';
import 'package:netflix/domain/downloads/i_downloads_repo.dart';
import 'package:netflix/domain/downloads/models/downloads.dart';
import 'package:netflix/domain/search/modle/search_resp/search_resp/search_resp.dart';
import 'package:netflix/domain/search/search_service.dart';

part 'search_event.dart';
part 'search_state.dart';
part 'search_bloc.freezed.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final IDownloadsRepo _downloadsService;
  final SearchService _searchService;
  SearchBloc(this._downloadsService, this._searchService)
      : super(SearchState.initial()) {
    on<Initialize>(
      (event, emit) async {
        if (state.idleList.isNotEmpty) {
          emit(SearchState(
              searchResultList: [],
              idleList: state.idleList,
              isLoading: false,
              isError: false));
          return;
        }
        emit(const SearchState(
            searchResultList: [],
            idleList: [],
            isLoading: true,
            isError: false));
        final _result = await _downloadsService.getDownloadsImages();
        log(_result.toString());
        final _state = _result.fold((MainFailure f) {
          return const SearchState(
              searchResultList: [],
              idleList: [],
              isLoading: false,
              isError: true);
        }, (List<Downloads> list) {
          return SearchState(
              searchResultList: [],
              idleList: list,
              isLoading: false,
              isError: false);
        });

        emit(_state);
      },
    );
    on<SearchMovie>((event, emit) async {
      emit(const SearchState(
          searchResultList: [], idleList: [], isLoading: true, isError: false));
      final _result =
          await _searchService.searchMovies(movieQuery: event.movieQuery);
      final _state = _result.fold((MainFailure f) {
        return const SearchState(
            searchResultList: [],
            idleList: [],
            isLoading: false,
            isError: true);
      }, (SearchResp r) {
        return SearchState(
            searchResultList: r.results,
            idleList: [],
            isLoading: false,
            isError: false);
      });
      emit(_state);
    });
  }
}
