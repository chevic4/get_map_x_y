import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'maps_screen_cubit/maps_screen_cubit.dart';

class MistakeWidgetResult extends StatelessWidget {
  const MistakeWidgetResult({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text('ошибка! введите координаты верно');
  }
}

class InfoWidgetResult extends StatelessWidget {
  const InfoWidgetResult({super.key});

  @override
  Widget build(BuildContext context) {
    final infoCubit = context.watch<ModelCubit>().state;
    return Card(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('координаты X'),
              Text(infoCubit.x),
              const Text('координаты Y'),
              Text(infoCubit.y),
            ],
          ),
          Image.network(
            infoCubit.url,
            width: 300,
            height: 200,
            errorBuilder: (context, error, stackTrace) {
              return Image.asset('assets/images/parking.jpg', width: 150);
            },
          ),
        ],
      ),
    );
  }
}
