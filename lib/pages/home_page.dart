import 'package:flutter/material.dart';
import 'package:pr_module_c_project/global/colors.dart';
import 'package:pr_module_c_project/global/variaveis.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController pageController = PageController(
    viewportFraction: 0.9,
  );
  int paginaAtual = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: corClara,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text('Olá, Estudante!'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.all(20),
          child: Column(
            spacing: 10,
            children: [
              SizedBox(
                width: double.infinity,
                height: 160,
                child: PageView.builder(
                  controller: pageController,
                  itemCount: 3,
                  onPageChanged: (value) {
                    setState(() {
                      paginaAtual = value;
                    });
                  },
                  itemBuilder: (context, index) {
                    final artigo = listArtigos[index];
                    return Padding(
                      padding: EdgeInsetsGeometry.symmetric(
                        horizontal: 5,
                      ),
                      child: GestureDetector(
                        onTap: artigo['id'] == 2
                            ? () {
                                Navigator.of(
                                  context,
                                ).pushNamed('/artigo');
                              }
                            : null,
                        child: Container(
                          decoration: BoxDecoration(
                            color: corEscuro,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: EdgeInsetsGeometry.symmetric(
                              vertical: 15,
                              horizontal: 15,
                            ),
                            child: Column(
                              spacing: 10,
                              mainAxisAlignment:
                                  MainAxisAlignment.end,
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      artigo['titulo'],
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: corClara,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      '${artigo['descricao']} ${artigo['data']}',
                                      style: TextStyle(
                                        color: corClara,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  height: 35,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: corClara,
                                      foregroundColor: corEscuro,
                                    ),
                                    child: Text('Começar agora'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Row(
                spacing: 10,
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (index) {
                  return Container(
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                      color: paginaAtual == index
                          ? corRoxoClaro
                          : corEscuro,
                      shape: BoxShape.circle,
                      border: Border.all(width: 1, color: corEscuro),
                    ),
                  );
                }),
              ),
              Divider(),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Artigos',
                  style: TextStyle(
                    color: corEscuro,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed('/artigo');
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: corEscuro,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsetsGeometry.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          artigosUnico['titulo'],
                          style: TextStyle(
                            color: corClara,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          '${artigosUnico['descricao']} ${artigosUnico['data']}',
                          style: TextStyle(
                            color: corClara,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
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
                        Icon(Icons.home, color: corRoxoMedio),
                        Text(
                          'Home',
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
                        Icon(Icons.person, color: corEscuro),
                        Text(
                          'Perfil',
                          style: TextStyle(
                            color: corEscuro,
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
                        Icon(Icons.note_alt, color: corEscuro),
                        Text(
                          'Resumos',
                          style: TextStyle(
                            color: corEscuro,
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
