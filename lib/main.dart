import 'package:flutter/material.dart';
import 'package:restaurant_app/common/styles.dart';
import 'package:restaurant_app/data/restaurant.dart';
import 'package:restaurant_app/ui/detailresto_page.dart';
import 'package:restaurant_app/ui/error_screen.dart';
import 'package:restaurant_app/ui/list_page.dart';
import 'package:restaurant_app/ui/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(elevation: 0),
        colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: primaryColor,
              onPrimary: Colors.black,
              secondary: secondaryColor,
            ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => SplashScreen(),
        ListPage.routeName: (context) => ListPage(),
        DetailRestoPage.routeName: (context) => DetailRestoPage(
              restaurants:
                  ModalRoute.of(context)?.settings.arguments as Restaurant,
            ),
        ErrorScreen.routeName: (context) => ErrorScreen(),
      },
    );
  }
}
