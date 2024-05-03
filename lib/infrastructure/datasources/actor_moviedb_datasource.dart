
import 'package:dio/dio.dart';

import 'package:cinemapedia/config/constants/environment.dart';
import 'package:cinemapedia/domain/datasources/actors_datasource.dart';
import 'package:cinemapedia/domain/entities/actor.dart';

import 'package:cinemapedia/infrastructure/mappers/actor_mapper.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/credits_response.dart';

class ActorMovieDbDatasource extends ActorsDatasource {

    final dio = Dio(BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key':Environment.theMovieDbKey,
        'language': 'es-MX'
      }
    ));

    // List<Actor> _jsonToActors( Map<String, dynamic> json ){

    //   final actorDbResponse = CreditsResponse.fromJson(json);
    //   final List<Actor> actors = actorDbResponse.cast.
    //   where((actorDB) => actorDB.profilePath != 'no profile')
    //   .map(
    //     (actorDB) => ActorMapper.castToEntity(actorDB)
    //   ).toList();

    //   return actors;
    // }

  @override
  Future<List<Actor>> getActorsBymovie(String movieId) async {

    final response = await dio.get('movie/$movieId/credits');
    final casResponse = CreditsResponse.fromJson(response.data);

    List<Actor> actors = casResponse.cast.map(
      (cast) => ActorMapper.castToEntity(cast)
    ).toList();
    
    return actors;
  }

}