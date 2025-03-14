import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/src/config/route.dart';
import 'package:flutter_ecommerce_app/src/pages/mainPage.dart';
import 'package:flutter_ecommerce_app/src/pages/product_detail.dart';
import 'package:flutter_ecommerce_app/src/widgets/customRoute.dart';
import 'package:google_fonts/google_fonts.dart';

import 'src/themes/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Commerce ',
      theme: AppTheme.lightTheme.copyWith(
        textTheme: GoogleFonts.mulishTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      debugShowCheckedModeBanner: false,
      routes: Routes.getRoute(),
      onGenerateRoute: (RouteSettings settings) {
        if (settings.name != null && settings.name?.contains('detail') == true) {
          return CustomRoute<bool>(
              builder: (BuildContext context) => ProductDetailPage(key: settings.arguments as Key? ?? Key('default')), settings: settings);
        } else {
          return CustomRoute<bool>(
              builder: (BuildContext context) => MainPage(key: Key('mainPage'), title: '',), settings: settings);
        }
      },
      initialRoute: "MainPage",
    );
  }
}
