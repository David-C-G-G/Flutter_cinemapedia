// los repositorios son quienes llaman el datasource

import 'package:cinemapedia/config/domain/entities/movie.dart';

abstract class MovieRepository {

  Future<List<Movie>> getNowPlaying({ int page = 1});

}