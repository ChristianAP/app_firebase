import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class addPedido extends StatelessWidget {
  TextEditingController nombre = TextEditingController();
  TextEditingController pedido = TextEditingController();
  TextEditingController cantidad = TextEditingController();
  TextEditingController destino = TextEditingController();

  CollectionReference ref = FirebaseFirestore.instance.collection('pedido');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Agregar Pedido"),
        actions: [
          MaterialButton(
            onPressed: () {
              ref.add({
                'nombre': nombre.text,
                'pedido': pedido.text,
                'cantidad': cantidad.text,
                'destino': destino.text,
              }).whenComplete(() {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => Home()));
              });
            },
            child: Icon(Icons.save),
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: nombre,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  icon: Icon(Icons.people_alt),
                  hintText: "Ingrese su nombre ...",
                  labelText: "Nombre del Comprador: ",
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: pedido,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  icon: Icon(Icons.maps_home_work_outlined),
                  hintText: "Ingrese su Pedido ...",
                  labelText: "Pedido a Solicitar: ",
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: cantidad,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  icon: Icon(Icons.confirmation_number_outlined),
                  hintText: "Ingrese la cantidad ...",
                  labelText: "Cantidad a Solicitar: ",
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: destino,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  icon: Icon(Icons.airplane_ticket),
                  hintText: "Ingrese el destino ...",
                  labelText: "¿A donde se lo llevamos?: ",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
