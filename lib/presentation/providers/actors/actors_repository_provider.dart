
import 'package:cinemapedia/infrastructure/datasources/actor_moviedb_datasource.dart';
import 'package:cinemapedia/infrastructure/repositories/actor_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



final actorsRepositoryProvider = Provider((ref) { //provider de solo lectura
  return ActorRepositoryImpl( ActorMovieDbDatasource() ); //aquí es donde se implementa lo que se hizo con anterioridad, si se requiere cambiar de API unicamente cambiamos lo de dentro de los parentesis
});