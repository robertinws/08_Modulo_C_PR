import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pr_module_c_project/pages/artigos_page.dart';
import 'package:pr_module_c_project/pages/home_page.dart';
import 'package:pr_module_c_project/pages/login_page.dart';
import 'package:pr_module_c_project/pages/perfil_page.dart';
import 'package:pr_module_c_project/pages/resumos_page.dart';
import 'package:pr_module_c_project/pages/splash_page.dart';

class AppController extends StatelessWidget {
  const AppController({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => SplashPage(),
        '/login': (context) => LoginPage(),
        '/home': (context) => HomePage(),
        '/artigo': (context) => ArtigosPage(),
        '/resumos': (context) => ResumosPage(),
        '/perfil': (context) => PerfilPage(),
      },
    );
  }
}
