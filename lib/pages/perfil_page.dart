import 'package:flutter/material.dart';
import 'package:pr_module_c_project/global/colors.dart';

class PerfilPage extends StatefulWidget {
  const PerfilPage({super.key});

  @override
  State<PerfilPage> createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: corEscuro,
      bottomNavigationBar: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 20,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(
                      context,
                    ).pushReplacementNamed('/home');
                  },
                  borderRadius: BorderRadius.circular(10),
                  child: Padding(
                    padding: EdgeInsetsGeometry.symmetric(
                      vertical: 2,
                      horizontal: 5,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.home, color: corClara),
                        Text(
                          'Home',
                          style: TextStyle(
                            color: corClara,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(10),
                  child: Padding(
                    padding: EdgeInsetsGeometry.symmetric(
                      vertical: 2,
                      horizontal: 5,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.person, color: corRoxoMedio),
                        Text(
                          'Perfil',
                          style: TextStyle(
                            color: corRoxoMedio,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(
                      context,
                    ).pushReplacementNamed('/resumos');
                  },
                  borderRadius: BorderRadius.circular(10),
                  child: Padding(
                    padding: EdgeInsetsGeometry.symmetric(
                      vertical: 2,
                      horizontal: 5,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.note_alt, color: corClara),
                        Text(
                          'Resumos',
                          style: TextStyle(
                            color: corClara,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
