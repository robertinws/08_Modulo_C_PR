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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        foregroundColor: corClara,
        title: Text('Perfil'),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.all(20),
          child: SingleChildScrollView(
            child: Column(
              spacing: 10,
              children: [
                Center(
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: corClara,
                    ),
                    child: Stack(
                      children: [
                        Center(
                          child: Icon(
                            Icons.person,
                            color: corEscuro,
                            size: 70,
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                            padding: EdgeInsetsGeometry.all(5),
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(
                                  255,
                                  236,
                                  236,
                                  236,
                                ),
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                              ),
                              padding: EdgeInsets.all(2),
                              child: Icon(
                                Icons.camera_alt,
                                color: corEscuro,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Text(
                  'Nome do Usuário',
                  style: TextStyle(
                    color: corClara,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'email@exemplo.com',
                  style: TextStyle(color: corClara, fontSize: 14),
                ),
                Text(
                  'Nível: iniciante',
                  style: TextStyle(color: corClara, fontSize: 12),
                ),
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: corRoxoMedio,
                      foregroundColor: corClara,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 10,
                      children: [
                        Icon(Icons.edit, color: corClara),
                        Text('Editar Perfil'),
                      ],
                    ),
                  ),
                ),
                Divider(),
                Text(
                  'Configurações',
                  style: TextStyle(
                    color: corClara,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
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
