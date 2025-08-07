import 'package:flutter/services.dart';

String caminhoCanal = 'com.example.pr_module_c_project';
MethodChannel methodChannel = MethodChannel('$caminhoCanal/main');
List<dynamic> listArtigos = [];
dynamic artigosUnico = '';
