import 'package:flutter/material.dart';
import 'package:flutter_test_yamap/const/const_text.dart';
import 'package:url_launcher/url_launcher.dart';

class ButtonLinkMap extends StatelessWidget {
  const ButtonLinkMap({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: ElevatedButton(
          onPressed: () async {
            await _launchURL();
          },
          child: const Text('ссылка на карту для удобства поиска координат')),
    );
  }
}

_launchURL() async {
  final uri = Uri.parse(urlExampeXY);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    throw 'Could not launch $urlExampeXY';
  }
}
