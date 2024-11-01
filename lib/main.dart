import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:thread/routes/routes.dart';
import 'package:thread/routes/routes_names.dart';
import 'package:thread/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Threads",
      theme: theme,
      getPages: Routes.pages,
      initialRoute: RoutesNames.register,
    );
  }
}
