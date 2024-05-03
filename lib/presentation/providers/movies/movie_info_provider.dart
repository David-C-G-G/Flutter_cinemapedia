import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cinemapedia/domain/entities/movie.dart';

final movieInfoProvider = StateNotifierProvider<MovieMapNotifier, Map<String, Movie>>((ref) {
  final movieRepository = ref.watch( movieRepositoryProvider);

  return MovieMapNotifier(getMovie: movieRepository.getMovieById);
});

/*
  {
    '934632': Movie(),
    '934633': Movie(),
    '935632': Movie(),
    '937632': Movie(),
    '938630': Movie(),
  }
*/

typedef GetMovieCallback = Future<Movie>Function(String movieId);

class MovieMapNotifier extends StateNotifier<Map<String,Movie>> {

  final GetMovieCallback getMovie;

  MovieMapNotifier({
    required this.getMovie
  }):super({});

  Future<void> loadMovie( String movieId ) async {
    if( state[movieId] != null ) return;

    // print('Realizando petición http');

    final movie = await getMovie( movieId );

    state = { ...state, movieId: movie };
  }

}