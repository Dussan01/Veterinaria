import 'dart:math';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:decimal/decimal.dart';

class Calculadora extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora IMC',
      home: MyCalculator(),
    );
  }
}

class MyCalculator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => Calculador();
}

class Calculador extends State<MyCalculator> {
  final controller_peso = TextEditingController();
  final controller_talla = TextEditingController();
  final my_form_key = GlobalKey<FormState>();
  final d = Decimal;

  String muestreImc = "";
  String pesoSugerido = "";

  //creamos la clase para calcular el peso de la mujer
  void PesoIdealMujer() {
    int pesoidealm = 21;
    int decimals = 2; // solo me muestra dos decimales
    int fad = pow(10, decimals); //formula mayor a 10 decimales
    //Realizamos las validaciones si algun campo este vacio
    if (my_form_key.currentState.validate()) {
      double peso = double.parse(controller_peso.text);
      double altura = double.parse(controller_talla.text);
      double rtaAltura = (altura) / 100;
      double alturapordos = rtaAltura * rtaAltura;
      double result = peso / alturapordos;

      double d = result;
      d = (d * fad).round() / fad;

      //formula para sugerir el peso ideal
      double sugerido = (pesoidealm * peso) / d;
      sugerido = (sugerido * fad).round() / fad;
      setState(() {
        muestreImc = "IMC es: $d";
      });
      setState(() {
        pesoSugerido = "Peso ideal es: $sugerido kg";
      });
    }
  }

  //formula para el hombre
  void PesoIdealHombre() {
    int pesoidealh = 24;
    int decimals = 2; // solo me muestra dos decimales
    int fad = pow(10, decimals); //formula mayor a 10 decimales
    //Realizamos las validaciones si algun campo este vacio
    if (my_form_key.currentState.validate()) {
      double peso = double.parse(controller_peso.text);
      double altura = double.parse(controller_talla.text);
      double rtaAltura = (altura) / 100;
      double alturapordos = rtaAltura * rtaAltura;
      double result = peso / alturapordos;

      double d = result;
      d = (d * fad).round() / fad;

      //formula para sugerir el peso ideal
      double sugerido = (pesoidealh * peso) / d;
      sugerido = (sugerido * fad).round() / fad;
      setState(() {
        muestreImc = "IMC es: $d";
      });
      setState(() {
        pesoSugerido = "Peso ideal es: $sugerido kg";
      });
    }
  }

  //Formula para hacer una operacion aritmetica
  void OperacionMatematica() {
    //Realizamos las validaciones si algun campo este vacio
    if (my_form_key.currentState.validate()) {
      double num1 = double.parse(controller_peso.text);
      double num2 = double.parse(controller_talla.text);

      double result = num1 / num2;

      setState(() {
        muestreImc = "La division es: $result";
      });
    }
  }

  // Parte del diseño
  @override
  Widget build(BuildContext context) {
    final ui.Size logicalSize = MediaQuery.of(context).size;
    final double _height = logicalSize.height;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Calculadora IMC'),
        backgroundColor: Color(0xFFf01DFD7),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {},
        ),
      ),
      body: Form(
          key: my_form_key,
          child: SingleChildScrollView(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Container(
                    width: 500,
                    height: 130,
                    decoration: BoxDecoration(
                      color: Color(0xFFf01DFD7),
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(80),
                          bottomLeft: Radius.circular(80)),
                    ),
                    child: Stack(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.center,
                          child: new Image(
                            width: 200.0,
                            height: 150.0,
                            image: new AssetImage('assets/images/scale.png'),
                          ),
                        )
                      ],
                    ),
                  ),

                  //agregamos un Container
                  Container(
                    padding: EdgeInsets.only(top: 40),
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: 150,
                          height: 50,
                          padding: EdgeInsets.all(7),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(color: Colors.black, blurRadius: 2)
                              ]),
                          child: TextFormField(
                            controller: controller_peso,
                            validator: (value) {
                              if (value.isEmpty) return "Digite el peso Kg";
                            },
                            decoration: InputDecoration(
                                hintText: "Peso Kg",
                                icon: Icon(
                                  Icons.account_balance_wallet,
                                  color: Colors.purpleAccent,
                                )),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        Divider(
                          color: Colors.black,
                          indent: 2000,
                        ),
                        Container(
                          width: 150,
                          height: 50,
                          padding: EdgeInsets.all(7),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(color: Colors.black, blurRadius: 2)
                              ]),
                          child: TextFormField(
                            controller: controller_talla,
                            validator: (value) {
                              if (value.isEmpty) return "Digita Estatura Cm";
                            },
                            decoration: InputDecoration(
                                hintText: "Estatura Cm",
                                icon: Icon(Icons.present_to_all,
                                    color: Colors.blueAccent)),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 30.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      FlatButton(
                        onPressed: PesoIdealMujer,
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                        color: Colors.pinkAccent,
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          children: <Widget>[Icon(Icons.person), Text('Mujer')],
                        ),
                      ),
                      VerticalDivider(),
                      FlatButton(
                        onPressed: PesoIdealHombre,
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                        color: Colors.blueAccent,
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          children: <Widget>[
                            Icon(Icons.person),
                            Text('Hombre')
                          ],
                        ),
                      ),
                      VerticalDivider(),
                      FlatButton(
                        onPressed: OperacionMatematica,
                        shape: new RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                        color: Colors.blueAccent,
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          children: <Widget>[
                            Icon(Icons.person),
                            Text('Division')
                          ],
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    height: 40.0,
                  ),
                  //caja de resultado
                  Container(
                    height: 50.0,
                    width: 300,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Color(0xFFFE2E64), Color(0xFFfF781D8)]),
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    //creamos resultado del TextFormField
                    child: Center(
                      child: Text(
                        muestreImc,
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    height: 15.0,
                  ),
                  Container(
                    height: 50.0,
                    width: 300,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Color(0xFFf04B4AE), Color(0xFFf81F7F3)]),
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    //creamos resultador del TextFormField
                    child: Center(
                      child: Text(
                        pesoSugerido,
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    height: 1,
                  ),
                  new Container(
                    padding: EdgeInsets.all(2.0),
                    child: Stack(
                      children: <Widget>[
                        Align(
                          child: new Image(
                            width: 300.0,
                            height: 200.0,
                            image: new AssetImage('assets/images/imcx.png'),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ))),
    );
  }
}
