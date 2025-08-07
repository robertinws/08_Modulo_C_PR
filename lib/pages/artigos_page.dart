import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pr_module_c_project/global/colors.dart';
import 'package:pr_module_c_project/global/variaveis.dart';
import 'package:video_player/video_player.dart';

class ArtigosPage extends StatefulWidget {
  const ArtigosPage({super.key});

  @override
  State<ArtigosPage> createState() => _ArtigosPageState();
}

class _ArtigosPageState extends State<ArtigosPage> {
  VideoPlayerController videoPlayerController =
      VideoPlayerController.asset('assets/videos/video_fisica.mp4');
  bool videoIniciado = false;

  @override
  void initState() {
    super.initState();
    iniciar();
  }

  void iniciar() async {
    await videoPlayerController.initialize().then((value) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
      backgroundColor: corEscuro,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        foregroundColor: corClara,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.share)),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.all(20),
          child: SingleChildScrollView(
            child: Column(
              spacing: 10,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      artigosUnico['titulo'],
                      style: TextStyle(
                        color: corClara,
                        fontSize: fonteApp + 8,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      '${artigosUnico['descricao']} ${artigosUnico['data']}',
                      style: TextStyle(
                        color: corClara,
                        fontSize: fonteApp - 4,
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    AspectRatio(
                      aspectRatio:
                          videoPlayerController.value.aspectRatio,
                      child: Stack(
                        children: [
                          VideoPlayer(videoPlayerController),
                          Align(
                            alignment: Alignment.center,
                            child: IconButton(
                              onPressed: () {
                                videoIniciado
                                    ? setState(() {
                                        videoIniciado = false;
                                        videoPlayerController.pause();
                                      })
                                    : setState(() {
                                        videoIniciado = true;
                                        videoPlayerController.play();
                                      });
                              },
                              icon: Icon(
                                videoIniciado
                                    ? Icons.pause
                                    : Icons.play_arrow,
                                size: 50,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Text(
                  artigosUnico['conteudo'],
                  style: TextStyle(
                    color: corClara,
                    fontSize: fonteApp,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (_) {
                              return AlertDialog(
                                backgroundColor: corClara,
                                title: Center(
                                  child: Text('Alterar Fonte'),
                                ),

                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(
                                      width: double.infinity,
                                      child: TextButton(
                                        onPressed: () {
                                          setState(() {
                                            fonteApp = 14;
                                          });
                                          Navigator.pop(context);
                                        },
                                        style: TextButton.styleFrom(
                                          backgroundColor:
                                              corRoxoMedio,
                                          foregroundColor: corClara,
                                        ),
                                        child: Text('Pequeno'),
                                      ),
                                    ),
                                    SizedBox(
                                      width: double.infinity,
                                      child: TextButton(
                                        onPressed: () {
                                          setState(() {
                                            fonteApp = 16;
                                          });
                                          Navigator.pop(context);
                                        },
                                        style: TextButton.styleFrom(
                                          backgroundColor:
                                              corRoxoMedio,
                                          foregroundColor: corClara,
                                        ),
                                        child: Text('Médio'),
                                      ),
                                    ),
                                    SizedBox(
                                      width: double.infinity,
                                      child: TextButton(
                                        onPressed: () {
                                          setState(() {
                                            fonteApp = 18;
                                          });
                                          Navigator.pop(context);
                                        },
                                        style: TextButton.styleFrom(
                                          backgroundColor:
                                              corRoxoMedio,
                                          foregroundColor: corClara,
                                        ),
                                        child: Text('Grande'),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        style: IconButton.styleFrom(
                          backgroundColor: const Color.fromARGB(
                            38,
                            255,
                            255,
                            255,
                          ),
                        ),
                        icon: Icon(
                          Icons.text_fields_outlined,
                          color: corClara,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        style: IconButton.styleFrom(
                          backgroundColor: const Color.fromARGB(
                            38,
                            255,
                            255,
                            255,
                          ),
                        ),
                        icon: Icon(Icons.settings, color: corClara),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      if (videoIniciado) {
                        setState(() {
                          videoIniciado = false;
                          videoPlayerController.pause();
                        });
                      } else {
                        setState(() {
                          videoIniciado = true;
                          videoPlayerController.setVolume(1);

                          videoPlayerController.play();
                        });
                      }
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: const Color.fromARGB(
                        38,
                        255,
                        255,
                        255,
                      ),
                      foregroundColor: corClara,
                    ),
                    child: Row(
                      spacing: 10,
                      children: [
                        Icon(Icons.headphones, color: corClara),
                        Text('Ouvir Algo'),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.dark_mode, color: corClara),
                  Flexible(
                    child: Slider(
                      value: brilho,
                      activeColor: corClara,
                      onChanged: (newValue) {
                        setState(() {
                          brilho = newValue;
                        });
                      },
                    ),
                  ),
                  Icon(Icons.light_mode_outlined, color: corClara),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
