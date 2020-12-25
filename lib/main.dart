import 'package:flutter/material.dart';
import 'package:gebeya_flutter_practicatl_exam/bloc/cart/cart_bloc.dart';
import 'package:gebeya_flutter_practicatl_exam/bloc/cart/cart_event.dart';
import 'package:gebeya_flutter_practicatl_exam/bloc/product/product.dart';
import 'package:gebeya_flutter_practicatl_exam/bloc/product/product_repository.dart';
import 'package:gebeya_flutter_practicatl_exam/screens/homepage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (BuildContext context) =>
          ProductBloc(productRepository: ProductRepository())..add(GetProductsEvent()),
    ),
    BlocProvider(
      create: (BuildContext context) =>
          CartBloc(sharedPreference: sharedPreferences)..add(GetCartItems()),
    )
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gebeya Talent',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Color(0xFF667EEA),
          fontFamily: 'roboto',
          appBarTheme: AppBarTheme(
            elevation: 0,
            color: Color(0xFFffffff),
            actionsIconTheme: IconThemeData(
              color: Colors.black45,
            ),
            iconTheme: IconThemeData(color: Colors.black45),
          ),
          textTheme: TextTheme(
              headline6: TextStyle(fontSize: 22.0, color: Colors.black),
              bodyText1: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black45,
                  fontWeight: FontWeight.w500),
              bodyText2: TextStyle(fontSize: 14.0, color: Colors.black45))),
      home: HomePage(),
    );
  }
}
