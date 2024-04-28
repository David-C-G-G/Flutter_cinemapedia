//el objetivo de este mapper es poder leer diferentes modelos
//y crear una entidad propia de la app
//prqacticamente se hace una conversion del objeto de consulta a nuestro objeto propio
//con el fin de que nuestra app siga funcionando y que el cambio no sea total sino específico

import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/movie_moviedb.dart';

class MovieMapper {

  static Movie movieDBToEntity( MovieFromMovieDB movieDB) => Movie(
    adult: movieDB.adult,
    backdropPath: (movieDB.backdropPath != '') 
      ? 'https://image.tmdb.org/t/p/w500${ movieDB.backdropPath }'
      : 'https://static.displate.com/857x1200/displate/2022-04-15/7422bfe15b3ea7b5933dffd896e9c7f9_46003a1b7353dc7b5a02949bd074432a.jpg',
    genreIds: movieDB.genreIds.map((e) => e.toString()).toList(),
    id: movieDB.id,
    originalLanguage: movieDB.originalLanguage,
    originalTitle: movieDB.originalTitle,
    overview: movieDB.overview,
    popularity: movieDB.popularity,
    posterPath: (movieDB.posterPath != '') 
      ? 'https://image.tmdb.org/t/p/w500${ movieDB.posterPath }'
      : 'no poster',
    releaseDate: movieDB.releaseDate,
    title: movieDB.title,
    video: movieDB.video,
    voteAverage: movieDB.voteAverage,
    voteCount: movieDB.voteCount
  );
}