import 'package:flutter/material.dart';

class MistakeWidgetResult extends StatelessWidget {
  const MistakeWidgetResult({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text('ошибка! введите координаты верно');
  }
}

class InfoWidgetResult extends StatelessWidget {
  final String x;
  final String y;
  final String url;

  const InfoWidgetResult(
      {super.key, required this.x, required this.y, required this.url});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('координаты X'),
              Text(x),
              const Text('координаты Y'),
              Text(y),
            ],
          ),
          Image.network(
            url,
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
