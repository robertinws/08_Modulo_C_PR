import 'package:flutter/material.dart';
import 'package:pr_module_c_project/global/colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  List<String> listValoresCampos = [];
  List<TextEditingController> listControllers = [];
  FocusNode focusNode = FocusNode();
  bool iniciou = false, error = false;

  @override
  void initState() {
    super.initState();
    iniciar();
  }

  void iniciar() async {
    listValoresCampos = ['', '', '', ''];
    listControllers = [
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
    ];
    setState(() {});
  }

  void validar() async {}

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
                            maxLength: 1,
                            focusNode: index == 0
                                ? focusNode
                                : FocusNode(),
                            controller: listControllers[index],
                            onChanged: (value) {
                              if (index == 3) {
                                if (value.trim().length == 1) {
                                  FocusScope.of(context).unfocus();
                                }
                              } else {
                                if (value.trim().length == 1) {
                                  FocusScope.of(context).unfocus();
                                  FocusScope.of(context).nextFocus();
                                }
                              }
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
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
                      onPressed: () {},
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
