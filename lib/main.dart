import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:my_awesome_namer_app/pages/my_home_page.dart';
import 'package:my_awesome_namer_app/statemanager/my_app_state.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xfff96ff33)),
        ),
        home: MyHomePage(), 
          debugShowCheckedModeBanner: false,
      ),
    );
  }
}

