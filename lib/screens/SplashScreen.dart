import 'package:compareprice/redux/modal/appModal.dart';
import 'package:compareprice/screens/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_redux/flutter_redux.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SplashScreenState();
  }
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var _duration = Duration(seconds: 15);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomeScreen()));
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
      onInit: (store) {
        store.dispatch(GetResults());
      },
      converter: (store) => store.state,
      builder: (context, state) {
        return Scaffold(
            body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Image(image: AssetImage('assets/logo.png')),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text("Please Wait....")
          ],
        ));
      },
    );
  }
}
