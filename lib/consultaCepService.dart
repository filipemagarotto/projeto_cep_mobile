import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'dart:convert'; // trabalha com o json
import 'package:http/http.dart' as http; // trabalha com o protocolo HTTP

class EnderecoEntity {
  final double distance;
  final List<Endereco> cepsInfo;
  EnderecoEntity({required this.distance, required this.cepsInfo});

  factory EnderecoEntity.fromJson(Map<String, dynamic> json) {
    var listCepsInfo = json['cepsInfo'] as List;
    List<Endereco> listEnderecos =
        listCepsInfo.map((i) => Endereco.fromJSON(i)).toList();

    return EnderecoEntity(
        distance: json['distance'] as double, cepsInfo: listEnderecos);
  }
}

class Endereco {
  final String cep;
  final String logradouro;
  final String complemento;
  final String bairro;
  final String localidade;
  final String uf;
  final String ibge;
  final String gia;
  final String ddd;
  final String siafi;
  Endereco(
      {required this.cep,
      required this.logradouro,
      required this.complemento,
      required this.bairro,
      required this.localidade,
      required this.uf,
      required this.ibge,
      required this.gia,
      required this.ddd,
      required this.siafi});

  factory Endereco.fromJSON(Map<String, dynamic> json) {
    return Endereco(
        cep: json['cep'] as String,
        logradouro: json['logradouro'] as String,
        complemento: json['complemento'] as String,
        bairro: json['bairro'] as String,
        localidade: json['localidade'] as String,
        uf: json['uf'] as String,
        ibge: json['ibge'] as String,
        gia: json['gia'] as String,
        ddd: json['ddd'] as String,
        siafi: json['siafi'] as String);
  }
}

class ConsultaCepService {
  static Future<dynamic> jsonRestApiHttp(primeiroCep, segundoCep) async {
    var endereco;

    if (primeiroCep.length > 0 && segundoCep.length > 0) {
      print('2 CEPS');
      Uri url = Uri.parse('https://distancep.herokuapp.com/distance/' +
          primeiroCep +
          '/' +
          segundoCep);

      http.Response response = await http.get(
        url,
        headers: <String, String>{
          "Content-Type": "Application/json; charset=UTF-8"
        },
      );

      final parsed = json.decode(response.body);
      if (!(parsed.containsKey('error'))) {
        endereco = EnderecoEntity.fromJson(parsed);
      }
    } else if (primeiroCep.length > 0) {
      print('1 CEP');
      try {
        Uri url =
            Uri.parse('https://viacep.com.br/ws/' + primeiroCep + '/json/');
        http.Response response = await http.get(
          url,
          headers: <String, String>{
            "Content-Type": "Application/json; charset=UTF-8"
          },
        );

        final parsed = json.decode(response.body);
        if (!(parsed.containsKey('erro'))) {
          endereco = Endereco.fromJSON(parsed);
        }
      } catch (error) {
        print(error);
      }
    }

    return endereco;
  }
}
