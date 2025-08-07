import 'package:flutter/material.dart';
import 'package:pr_module_c_project/global/colors.dart';
import 'package:pr_module_c_project/global/variaveis.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  List<TextEditingController> listControllers = [];
  FocusNode focusNode = FocusNode();
  bool iniciou = false, error = false;
  List<int> listValores = [];

  @override
  void initState() {
    super.initState();
    iniciar();
  }

  void iniciar() async {
    listControllers = [
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
    ];
    listValores = [-1, -1, -1, -1];
    setState(() {});
  }

  void validar() async {
    bool errorCamposVazio = false;
    for (int h = 0; h < listControllers.length; h++) {
      if (listControllers[h].text.isEmpty) {
        errorCamposVazio = true;
      }
    }
    if (errorCamposVazio) {
      await methodChannel.invokeMethod('toast', [
        'Todos os campos são obrigatórios',
      ]);
    } else {
      String resultado = '';
      for (int i = 0; i < listValores.length; i++) {
        resultado = '$resultado${listValores[i]}';
      }
      if (resultado == '3245') {
        Navigator.of(context).pushReplacementNamed('/home');
      } else {
        setState(() {
          error = true;
        });
        await methodChannel.invokeMethod('toast', ["Pin incorreto"]);
        await Future.delayed(Duration(seconds: 2), () {
          setState(() {
            error = false;
            print('owjdwojdwjow');
          });
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!iniciou) {
      iniciou = true;
      FocusScope.of(context).requestFocus(focusNode);
    }
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsetsGeometry.all(20),
            child: SingleChildScrollView(
              child: Column(
                spacing: 15,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    height: 100,
                    'assets/images/logo_main.png',
                    fit: BoxFit.cover,
                  ),
                  Container(height: 20),
                  Text('Digite seu PIN de acesso'),
                  Row(
                    children: List.generate(4, (index) {
                      return Flexible(
                        child: Padding(
                          padding: EdgeInsetsGeometry.symmetric(
                            horizontal: 20,
                            vertical: 5,
                          ),
                          child: TextField(
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            maxLength: 1,
                            focusNode: index == 0
                                ? focusNode
                                : FocusNode(),
                            controller: listControllers[index],
                            onChanged: (value) {
                              if (index == 3) {
                                if (value.length == 1) {
                                  FocusScope.of(context).unfocus();
                                }
                              } else {
                                if (value.length == 1) {
                                  FocusScope.of(context).unfocus();
                                  FocusScope.of(context).nextFocus();
                                }
                              }
                              if (value.isEmpty) {
                                listValores[index] = -1;
                              } else {
                                listValores[index] = int.parse(value);
                              }
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: error
                                      ? Colors.red
                                      : corRoxoMedio,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: error
                                      ? Colors.red
                                      : corRoxoMedio,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: validar,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: corRoxoMedio,
                        foregroundColor: corClara,
                      ),
                      child: Text('Entrar'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
