
import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/credits_response.dart';

class ActorMapper {

  static Actor castToEntity ( Cast cast ) => 
  Actor(
    id: cast.id, 
    name: cast.name, 
    profilePath: cast.profilePath != null
      ? 'https://image.tmdb.org/t/p/w500${ cast.profilePath }'
      : 'https://www.pngitem.com/pimgs/m/499-4992374_sin-imagen-de-perfil-hd-png-download.png', 
    character: cast.character
  );
}