import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GoogleMapController mapsController;
  String buscarDireccion;

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          GoogleMap(onMapCreated: onMapCreated, initialCameraPosition: _kLake
          ),
          Positioned(top: 30.0, right: 15.0, left: 15.0, child: Container(
            height: 50.0,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.white
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Ingrese direccion',
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(left: 15.0, top: 15.0),
                suffixIcon: IconButton(
                  icon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: barraBusqueda(),
                    iconSize: 30.0,
                  ),
                ),
              ),
              onChanged: (val){
                setState(() {
                 buscarDireccion = val; 
                });
              },
            ),
          ),)
        ],
      ),
    );
  }

  //metodo de busqueda 
  barraBusqueda(){
    // primero importamos la libreria 
    Geolocator().placemarkFromAddress(buscarDireccion).then((result){
      mapsController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target:
        LatLng(result[0].position.latitude, result[0].position.latitude),
        zoom: 10.0
      )));
      
    });
  }

  void onMapCreated(controller) {
    setState(() {
      mapsController = controller;
    });
  }
}
