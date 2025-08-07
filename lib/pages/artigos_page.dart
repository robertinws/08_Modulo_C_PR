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
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      '${artigosUnico['descricao']} ${artigosUnico['data']}',
                      style: TextStyle(color: corClara, fontSize: 14),
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
                  style: TextStyle(color: corClara, fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
