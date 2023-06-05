import 'package:flutter/material.dart';
import 'package:flutter_application_1/api/themoviedbservice.dart';
import 'package:flutter_application_1/api/movies.dart';
import 'package:flutter_application_1/ui/spinnerwidget.dart';
import 'package:flutter_application_1/ui/cajapelicula.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your app.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green ,
      ),
      home: MovieDBPage(),
    );
  }
}


class MovieDBPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Rated Edward Movies')),
        body: FutureBuilder(
          // could put
          //initialData: [],
          future: TheMovieDBService.getTopRatedMovies() ,
          builder: (BuildContext Context, AsyncSnapshot<List> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data !.length,
                itemBuilder: (context, index) {
                  var movie = snapshot.data ! [index];
                  return CajaPelicula(peli:movie);
                },
              );
            } else {
              return SpinnerWidget();
            }
          },
        ));
  }
}
