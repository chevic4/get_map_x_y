import 'package:flutter/material.dart';
import 'package:flutter_test_yamap/const/const_text.dart';

class AppTitleWidget extends StatelessWidget {
  const AppTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(textTitle, style: Theme.of(context).textTheme.headlineSmall),
    );
  }
}

class AppExampleWidget extends StatelessWidget {
  const AppExampleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(exampeText, style: Theme.of(context).textTheme.bodyLarge),
    );
  }
}
