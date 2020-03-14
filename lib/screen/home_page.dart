import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider_test/screen/settings.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Settings()));
            },
          )
        ],
      ),
      body: Container(
        child: Text("tareq"),
      ),
    );
  }
}
