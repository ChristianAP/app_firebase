import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:app_firebase/main.dart';
import 'package:flutter/material.dart';

class editPedido extends StatefulWidget {
  DocumentSnapshot docid;
  editPedido({required this.docid});

  @override
  _editPedidoState createState() => _editPedidoState();
}

class _editPedidoState extends State<editPedido> {
  TextEditingController nombre = TextEditingController();
  TextEditingController pedido = TextEditingController();
  TextEditingController cantidad = TextEditingController();
  TextEditingController destino = TextEditingController();

  @override
  void initState() {
    nombre = TextEditingController(text: widget.docid.get('nombre'));
    pedido = TextEditingController(text: widget.docid.get('pedido'));
    cantidad = TextEditingController(text: widget.docid.get('cantidad'));
    destino = TextEditingController(text: widget.docid.get('destino'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          MaterialButton(
            onPressed: () {
              widget.docid.reference.update({
                'nombre': nombre.text,
                'pedido': pedido.text,
                'cantidad': cantidad.text,
                'destino': destino.text,
              }).whenComplete(() {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => Home()));
              });
            },
            child: Icon(Icons.save_alt_outlined),
          ),
          MaterialButton(
            onPressed: () {
              widget.docid.reference.delete().whenComplete(() {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => Home()));
              });
            },
            child: Icon(Icons.delete_forever),
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
