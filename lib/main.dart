import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_test/provider/settings_provider.dart';
import 'package:provider_test/screen/home_page.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => SettingsProvider(),
      child: MaterialApp(
        title: "New Day",
        home: HomePage(),
      ),
    );
  }
}
