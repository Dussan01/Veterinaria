import 'package:flutter/material.dart';
void main() => runApp(new Vendedores());
class Vendedores extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Paginas de ventas'),
      ),
      body: Column(
        children: <Widget>[
          Text('Estamos en ventas'),
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