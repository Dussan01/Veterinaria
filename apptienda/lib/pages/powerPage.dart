import 'package:flutter/material.dart';
void main() => runApp(new Power());
class Power extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Paginas de ventas'),
      ),
      body: Column(
        children: <Widget>[
          Text('Estamos en pestaña'),
          RaisedButton(
            child: Text("Salir"),
            onPressed: (){
              Navigator.pushReplacementNamed(context, '/LoginPage');
            },
          )
        ],
      ),
      
    );
  }
}