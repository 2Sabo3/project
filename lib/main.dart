import 'package:flutter/material.dart';
import 'package:project/Provider/Jobs/jobscall.dart';

import 'package:provider/provider.dart';

import 'package:project/Screens/home_screen.dart';
import 'package:project/Provider/Category/categorycall.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: FetchingCategory(),
        ),
        ChangeNotifierProvider.value(
          value: FetchingJobs(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Project',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
