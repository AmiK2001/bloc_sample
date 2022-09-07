import 'package:bloc_testing/app/app.dart';
import 'package:bloc_testing/app/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main(List<String> args) {
  runApp(
    MultiBlocProvider(
      providers: providers,
      child: const App(),
    ),
  );
}
