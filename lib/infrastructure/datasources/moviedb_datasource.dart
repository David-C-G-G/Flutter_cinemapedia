//aqui es donde se instalo desde pusbect la librería "dio"
//para hacer peticiones http.

import 'package:dio/dio.dart';

import 'package:cinemapedia/config/constants/environment.dart';
import 'package:cinemapedia/domain/datasources/movies_datasource.dart';

import 'package:cinemapedia/infrastructure/mappers/movie_mapper.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/moviedb_response.dart';
import 'package:cinemapedia/domain/entities/movie.dart';

class MoviedbDatasource extends MoviesDataSource{ //cliente de peticiones http
    // elevamos esta variable a propiedad de clase, en caso de que lleguemos a tener a parte de getnowplaying 
    //alguna otra clase abstracta que se requiera implementar proveniente de un recurso diferente.
    final dio = Dio(BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Environment.theMovieDbKey,
        'language': 'es-MX',
      }
    ));

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    
    final response = await dio.get('/movie/now_playing');

    final movieDBResponse = MovieDbResponse.fromJson(response.data);

    final List<Movie> movies = movieDBResponse.results
    .where((movieDB) => movieDB.posterPath != 'no poster')
    .map(
      (movieDB) => MovieMapper.movieDBToEntity(movieDB)
    ).toList();

    //podria usarse las lineas de arriba como
    // return movies = movieDBResponse.results.map(
    //   (movieDB) => MovieMapper.movieDBToEntity(movieDB)
    // ).toList();
    
    return movies;
  }


}