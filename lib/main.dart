import 'package:cross/pages/adamas.dart';
import 'package:cross/pages/rootView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../routes.dart';


void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360,690),
      builder:()=> MaterialApp(
        debugShowCheckedModeBanner: false,
        routes:{
          "/":(context) => adamaspage(),
          Routes.rootView : (context) => rootView(),
          // Routes.Event: (context) => Events(),
          // Routes.HelpPage: (context) => HelpPage(),
          // Routes.Academic:(context) => Academic(),
          // Routes.rootView1 : (context) => rootView1(),
        } ,
      ),
    );
  }
}





