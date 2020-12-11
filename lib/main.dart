import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tokenlab/views/home_view.dart';
import 'package:tokenlab/views/movie_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Color(0xff192428),
  ));

  runApp(MaterialApp(
    theme: ThemeData(
      accentColor: Color(0xff0784B5),
      backgroundColor: Color(0xff192428),
    ),
    initialRoute: '/',
    routes: {
      '/': (context) => HomeView(),
      '/movie': (context) => MovieView(
            idMovie: ModalRoute.of(context).settings.arguments,
          ),
    },
    debugShowCheckedModeBanner: false,
  ));
}
