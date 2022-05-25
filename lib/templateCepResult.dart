import 'package:flutter/material.dart';
import 'ConsultaCepService.dart';

class TemplateCepResult extends StatelessWidget {
  final dynamic conteudo;

  // recebe os dados da tela anterior (origem)
  TemplateCepResult({required this.conteudo});

  @override
  Widget build(BuildContext context) {
    print(conteudo.runtimeType);
    if (conteudo is EnderecoEntity) {
      return Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(100.0, 0, 100.0, 0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  width: 159,
                  height: 200,
                  child: Image.asset('assets/images/buscacep_logo.png'),
                ),
                Container(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Distância: ' + conteudo.distance.toString() + 'KM',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
                Container(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('\n'),
                  ),
                ),
                Container(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Cep: ' + conteudo.cepsInfo[0].cep,
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                  ),
                ),
                Container(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                        'Logradouro: ' + conteudo.cepsInfo[0].logradouro,
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                  ),
                ),
                Container(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Bairo: ' + conteudo.cepsInfo[0].bairro,
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                  ),
                ),
                Container(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                        'Localidade: ' +
                            conteudo.cepsInfo[0].localidade +
                            '/' +
                            conteudo.cepsInfo[0].uf,
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                  ),
                ),
                Container(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('\n'),
                  ),
                ),
                Container(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Cep: ' + conteudo.cepsInfo[1].cep,
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                  ),
                ),
                Container(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                        'Logradouro: ' + conteudo.cepsInfo[1].logradouro,
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                  ),
                ),
                Container(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Bairro: ' + conteudo.cepsInfo[1].bairro,
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                  ),
                ),
                Container(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                        'Localidade: ' +
                            conteudo.cepsInfo[1].localidade +
                            '/' +
                            conteudo.cepsInfo[1].uf,
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                  ),
                ),
                Text('\n'),
                Padding(
                  padding: EdgeInsets.only(top: 40.0, bottom: 50.0),
                  child: Container(
                    // similar ao "div"
                    height: 50.0,
                    child: RawMaterialButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Nova busca',
                        style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontSize: 25.0),
                      ),
                      fillColor: Color.fromRGBO(130, 87, 227, 1),
                    ),
                  ),
                )
              ]),
        ),
      );
    } else {
      return Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(100.0, 0, 100.0, 0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  width: 159,
                  height: 200,
                  child: Image.asset('assets/images/buscacep_logo.png'),
                ),
                Container(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Cep: ' + conteudo.cep,
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                  ),
                ),
                Container(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Logradouro: ' + conteudo.logradouro,
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                  ),
                ),
                Container(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Bairo: ' + conteudo.bairro,
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                  ),
                ),
                Container(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                        'Localidade: ' +
                            conteudo.localidade +
                            '/' +
                            conteudo.uf,
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                  ),
                ),
                Text('\n'),
                Padding(
                  padding: EdgeInsets.only(top: 50.0, bottom: 50.0),
                  child: Container(
                    // similar ao "div"
                    height: 50.0,
                    child: RawMaterialButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Nova busca',
                        style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontSize: 25.0),
                      ),
                      fillColor: Color.fromRGBO(130, 87, 227, 1),
                    ),
                  ),
                )
              ]),
        ),
      );
    }
  }
}
