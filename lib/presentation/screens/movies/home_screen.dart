import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';


class HomeScreen extends StatelessWidget {

  static const String name = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // body: Center(
      //   child: Text(Environment.theMovieDbKey),
      // )
      body: _HomeView(),
      bottomNavigationBar: CustomBottomNavigationbar()
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {

  @override
  void initState() {
    super.initState();

    ref.read( nowPlayingMoviesProvider.notifier ).loadNextPage();
    ref.read( popularMoviesProvider.notifier ).loadNextPage();
    ref.read( upcomingMoviesProvider.notifier ).loadNextPage();
    ref.read( topRatedMoviesProvider.notifier ).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {

    final slideShowMovies = ref.watch( moviesSlideShowProvider );
    final nowPlayingMovies = ref.watch( nowPlayingMoviesProvider );
    final popularMovies = ref.watch( popularMoviesProvider );
    final upcomingMovies = ref.watch( upcomingMoviesProvider );
    final topRatedMovies = ref.watch( topRatedMoviesProvider );

    // if ( movies.length == 0 ) return CircularProgressIndicator();

    // return SingleChildScrollView( //esta opcion es buena si solo quieres deslizar 
    // );
    return CustomScrollView( //esta opcion es parecida al singlechildscrollview pero mas personalizado
      slivers: [

        const SliverAppBar(
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            titlePadding: EdgeInsets.symmetric(),
            title: CustomAppbar(),
          ),
        ),


        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Column(
                children: [
              
                  // const CustomAppbar(),
              
                  MoviesSlideShow(
                    movie: slideShowMovies
                  ),
              
                  MoviesHorizontalListview(
                    movies: nowPlayingMovies,
                    title: 'En cines',
                    subTitle: 'Lunes 29',
                    loadNextPage: () {
                      ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
                    },
                  ),


                  MoviesHorizontalListview(
                    movies: upcomingMovies,
                    title: 'Proximamente',
                    subTitle: 'Estrenos',
                    loadNextPage: () => ref.read(upcomingMoviesProvider.notifier).loadNextPage()
                  ),


                  MoviesHorizontalListview(
                    movies: popularMovies,
                    title: 'Populares',
                    subTitle: 'Mas vistos',
                    loadNextPage: () => ref.read(popularMoviesProvider.notifier).loadNextPage()
                  ),


                  MoviesHorizontalListview(
                    movies: topRatedMovies,
                    title: 'Mejor Calificadas',
                    subTitle: 'Este mes',
                    loadNextPage: () => ref.read(topRatedMoviesProvider.notifier).loadNextPage()
                  ),
              
              
                  // Expanded(
                  //   child: ListView.builder(
                  //     itemCount: nowPlayingMovies.length,
                  //     itemBuilder: (context, index) {
                  //       final movie = nowPlayingMovies[index];
                  //       return ListTile(
                  //         title: Text( movie.title ),
                  //       );
                  //     },
                  //   ),
                  // )
                ],
              );
            },
            childCount: 1,
          ),
        )


      ],
    );
  }
}