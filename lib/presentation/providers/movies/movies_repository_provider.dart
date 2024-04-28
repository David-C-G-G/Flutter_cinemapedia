//aquí se instalo el gestor de estado desde pubspect
//flutter_riverpod

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapedia/infrastructure/repositories/movie_respository_impl.dart';
import 'package:cinemapedia/infrastructure/datasources/moviedb_datasource.dart';

//Este repositorio es inmutable, objetivo es proporcionar a todos los demás providers
//información necesaria para poder consultar todo lo que aquí se proporciona, de momento es solo getNowPlaying()
final movieRepositoryProvider = Provider((ref) { //provider de solo lectura
  return MovieRepositoryImpl( MoviedbDatasource() ); //aquí es donde se implementa lo que se hizo con anterioridad, si se requiere cambiar de API unicamente cambiamos lo de dentro de los parentesis
});