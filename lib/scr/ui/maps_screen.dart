import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_yamap/scr/ui/result_widget.dart';
import 'maps_screen_cubit/maps_screen_cubit.dart';
import 'maps_screen_cubit/maps_screen_state.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    final infoCubit = context.read<ModelCubit>();
    return Scaffold(
      body: SafeArea(
        child: Center(child:
            BlocBuilder<ModelCubit, ModelState>(builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Card(
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const Text('широта (latitude)',
                            style: TextStyle(color: Colors.blueAccent)),
                        TextField(
                          keyboardType: TextInputType.number,
                          onChanged: (value) => infoCubit.setLatitude(value),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const Text('долгота (longitude)',
                            style: TextStyle(color: Colors.blueAccent)),
                        TextField(
                            keyboardType: TextInputType.number,
                            onChanged: (value) =>
                                infoCubit.setLongitude(value)),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Card(
                  child: Column(
                    children: [
                      const Text('zoom'),
                      Slider(
                        min: 13,
                        max: 23,
                        divisions: 10,
                        label: infoCubit.state.zoom.toString(),
                        value: infoCubit.state.zoom.toDouble(),
                        onChanged: infoCubit.state.zoomActive
                            ? (va) {
                                infoCubit.setZoom(va);
                              }
                            : null,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                    onPressed: infoCubit.getStateForInfo,
                    child: const Text('get tail')),
                infoCubit.state.okData
                    ? InfoWidgetResult(
                        x: infoCubit.state.x,
                        y: infoCubit.state.y,
                        url: infoCubit.state.url,
                      )
                    : const MistakeWidgetResult(),
              ],
            ),
          );
        })),
      ),
    );
  }
}
