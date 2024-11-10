import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slimyfaq/bloc/cart.bloc.dart';
import 'package:slimyfaq/views/login.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => CartBloc(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Ecomm',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        fontFamily: GoogleFonts.lato().fontFamily,
      ),
      home: const LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
