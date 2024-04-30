

import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/movies/movies_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//*Now playing
final nowPlayingMoviesProvider = StateNotifierProvider<MoviesNotifier, List<Movie>> ((ref) {

  final fetchMoreMovies = ref.watch( movieRepositoryProvider ).getNowPlaying;
  
  return MoviesNotifier(
    fetchMoreMovies: fetchMoreMovies
  );

});

//*Popular
final popularMoviesProvider = StateNotifierProvider<MoviesNotifier, List<Movie>> ((ref) {

  final fetchMoreMovies = ref.watch( movieRepositoryProvider ).getPopular;
  
  return MoviesNotifier(
    fetchMoreMovies: fetchMoreMovies
  );

});

//*Upcoming
final upcomingMoviesProvider = StateNotifierProvider<MoviesNotifier, List<Movie>> ((ref) {

  final fetchMoreMovies = ref.watch( movieRepositoryProvider ).getUpcoming;
  
  return MoviesNotifier(
    fetchMoreMovies: fetchMoreMovies
  );

});

//*Top Rated
final topRatedMoviesProvider = StateNotifierProvider<MoviesNotifier, List<Movie>> ((ref) {

  final fetchMoreMovies = ref.watch( movieRepositoryProvider ).getTopRated;
  
  return MoviesNotifier(
    fetchMoreMovies: fetchMoreMovies
  );

});

typedef MovieCallback = Future<List<Movie>> Function({ int page });

class MoviesNotifier extends StateNotifier<List<Movie>> {

  int currentPage = 0;
  bool isloading = false;
  MovieCallback fetchMoreMovies;

  MoviesNotifier({
    required this.fetchMoreMovies,
  }):super([]);

  Future<void> loadNextPage() async {

    if( isloading ) return;
    isloading = true;

    // print('loading more movies');

    currentPage++;

    //hará una modificación al state
    final List<Movie> movies = await fetchMoreMovies(page: currentPage);
    state = [...state, ...movies];

    //la siguiente funcionalidad del await hará que se rendericen las imagenes
    await Future.delayed(const Duration(milliseconds: 300));

    isloading = false;
  }

}