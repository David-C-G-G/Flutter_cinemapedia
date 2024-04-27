//origenes de datos

import 'package:cinemapedia/config/domain/entities/movie.dart';

abstract class MovieDataSource {

  Future<List<Movie>> getNowPlaying({ int page = 1});
}