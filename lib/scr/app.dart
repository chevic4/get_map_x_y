import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_yamap/scr/ui/maps_screen.dart';
import 'package:flutter_test_yamap/scr/ui/maps_screen_cubit/maps_screen_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (_) => ModelCubit(),
        child: const MapScreen(),
      ),
    );
  }
}
