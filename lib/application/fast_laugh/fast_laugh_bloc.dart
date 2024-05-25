import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/downloads/i_downloads_repo.dart';

import '../../domain/downloads/models/downloads.dart';

part 'fast_laugh_event.dart';
part 'fast_laugh_state.dart';
part 'fast_laugh_bloc.freezed.dart';

final dummyvideoUrLs = [
  "https://www.exit109.com/~dnn/clips/RW20seconds_1.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerMeltdowns.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/Sintel.mp4",
];

@injectable
class FastLaughBloc extends Bloc<FastLaughEvent, FastLaughState> {
  FastLaughBloc(IDownloadsRepo _downloadService)
      : super(FastLaughState.initial()) {
    on<FastLaughEvent>((event, emit) async {
      //Sending loading to ui
      emit(const FastLaughState(
        videosList: [],
        isLoading: true,
        isError: false,
        likedVideosIds: [],
      ));
      // trending movies
      final _result = await _downloadService.getDownloadsImages();
      final _state = _result.fold(
        (l) {
          return FastLaughState(
            videosList: [],
            isLoading: false,
            isError: true,
            likedVideosIds: state.likedVideosIds,
          );
        },
        (resp) => FastLaughState(
            videosList: resp,
            isLoading: false,
            isError: false,
            likedVideosIds: state.likedVideosIds),
      );
      //send to ui
      emit(_state);
    });

    // on<LikeVideo>((event, emit) async {
    //   state.likedVideosIds.add(event.id);
    //   emit(state.copywith(likedVideosIds: state.likedVideosIds));
    // });

    // on<UnLikeVideo>((event, emit) async {
    //   state.likedVideosIds.remove(event.id);
    //   emit(state.copywith(likedVideosIds: state.likedVideosIds));
    // });
  }
}
