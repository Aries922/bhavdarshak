import 'package:bhavdarshak/screens/home_screen.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return WidgetsApp(
      color: Colors.blue,
      pageRouteBuilder: <T>(RouteSettings settings, WidgetBuilder builder) {
        return PageRouteBuilder<T>(
          settings: settings,
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return builder(context);
          },
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
      },
      builder: (BuildContext context, Widget? navigator) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.green,
          ),
          home: HomeScreen(),
        );
      },
    );
  }
}
