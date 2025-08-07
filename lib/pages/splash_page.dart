import 'package:flutter/material.dart';
import 'package:pr_module_c_project/global/colors.dart';
import 'package:pr_module_c_project/global/variaveis.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  double valorRotacao = 0;

  @override
  void initState() {
    super.initState();
    iniciar();
  }

  void iniciar() async {
    animacaoEntrada();
  }

  void animacaoEntrada() async {
    bool primeiraVez = false;
    int tempo = 0;
    primeiraVez = await methodChannel.invokeMethod('primeiraVez');
    if (primeiraVez) {
      tempo = 10;
    } else {
      tempo = 3;
    }

    await Future.delayed(Duration(seconds: 1), () async {
      int vezes = 0;
      while (vezes < tempo) {
        await Future.delayed(Duration(seconds: 1), () async {
          for (int i = 0; i < 10; i++) {
            await Future.delayed(Duration(milliseconds: 50), () {
              setState(() {
                valorRotacao = valorRotacao + 0.02;
              });
            });
          }
        });
        vezes++;
      }
    });
    Navigator.of(context).pushReplacementNamed('/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: corClara,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(0, valorRotacao),
                colors: [corRoxoEscuro, corRoxoMedio],
              ),
            ),
          ),
          Center(
            child: Image.asset(
              height: 100,
              'assets/images/logo_light.png',
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
