// @dart=2.9
import 'package:flutter/material.dart';

import 'ConsultaCepService.dart';
import 'TemplateCepResult.dart';

void main() {
  runApp(
    MaterialApp(
      home: Home(), // rota de entrada (start here)
      debugShowCheckedModeBanner: false, // remove o banner
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromRGBO(32, 31, 36, 1), //<-- SEE HERE
      ),
    ),
  );
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

showAlertDialog(BuildContext context) {
  // set up the button
  Widget okButton = TextButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.pop(context, true);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("OPS!"),
    content: Text("Localidade não encontrada. Tente novamente."),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

class _HomeState extends State<Home> {
  // Esta classe terá todo o conteúdo da aplicação,
  // incluindo a lógica e os controles (campos de entrada) e
  // botões de ação (calcular e reset)

  // vamos implentar nossos "controles" (campos)
  TextEditingController primeiroCep = TextEditingController();
  TextEditingController segundoCep = TextEditingController();

  // controle para o nosso formulário
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // variável que receberá os dados sobre o abastecimento
  String _resultado = '';

  // montando o ambiente do aplicativo
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // criando o corpo de entrada de dados

      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(100.0, 0, 100.0, 0),
        child: Form(
          key: _formKey, // associando o formulário ao controle
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                width: 159,
                height: 200,
                child: Image.asset('assets/images/buscacep_logo.png'),
              ),

              // criando os campos de entrada
              TextFormField(
                controller: primeiroCep,
                textAlign: TextAlign.left,
                keyboardType: TextInputType.number,
                // validando a entrada de dados
                validator: (value) => value.isEmpty ? 'Informe o cep' : null,
                decoration: InputDecoration(
                  labelText: 'CEP',
                  labelStyle: TextStyle(color: Colors.white),
                  //labelStyle: TextStyle(color: Colors.black),
                ),
                style: TextStyle(color: Colors.white, fontSize: 25.0),
              ),

              TextFormField(
                controller: segundoCep,
                textAlign: TextAlign.left,
                keyboardType: TextInputType.number,

                // validando a entrada de dados
                decoration: InputDecoration(
                    helperStyle: TextStyle(color: Colors.white),
                    helperText:
                        'Inserindo o segundo cep, será feito um cálculo de distância referente ao primeiro.',
                    labelText: 'CEP (opcional)',
                    labelStyle: TextStyle(color: Colors.white),
                    helperMaxLines: 5),
                style: TextStyle(color: Colors.white, fontSize: 25.0),
              ),

              // criando o botão
              Padding(
                padding: EdgeInsets.only(top: 50.0, bottom: 50.0),
                child: Container(
                  // similar ao "div"

                  height: 50.0,
                  child: RawMaterialButton(
                    onPressed: () {
                      // verificar se os campos estão preenchidos
                      if (_formKey.currentState.validate()) {
                        ConsultaCepService.jsonRestApiHttp(
                                primeiroCep.text, segundoCep.text)
                            .then((obj) {
                          if (obj != null) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      TemplateCepResult(conteudo: obj),
                                ));
                          } else {
                            showAlertDialog(context);
                          }
                        });
                      }
                    },
                    child: Text(
                      'Buscar',
                      style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontSize: 25.0),
                    ),
                    fillColor: Color.fromRGBO(130, 87, 227, 1),
                  ),
                ),
              ),
              Text(
                _resultado,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.lightBlue[900], fontSize: 25.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
